const Elm = require('./Main.elm')
import * as fs from 'fs-extra'
import { GraphQLClient } from 'graphql-request'
import * as http from 'http'
import * as minimist from 'minimist'
import * as request from 'request'
import { spawn } from 'child_process'

const usage = `Usage:
  graphqelm url # generate files based on the schema at \`url\` in folder ./src/Api
  graphqelm url --base My.Api.Submodule # generate files based on the schema at \`url\` in folder ./src/My/Api/Submodule
  graphqelm url [--header 'headerKey: header value'...] # you can supply multiple header args`

const args = minimist(process.argv.slice(2))
const baseModuleArg: undefined | string = args.base
const headerArg: undefined | string | [string] = args.header
const addHeader = (object: any, header: string) => {
  const [headerKey, headerValue] = header.split(':')
  object[headerKey] = headerValue
  return object
}
let headers = {}
if (typeof headerArg === 'string') {
  addHeader(headers, headerArg)
} else if (headerArg == undefined) {
} else {
  headerArg.forEach(header => {
    addHeader(headers, header)
  })
}
const baseModule = baseModuleArg ? baseModuleArg.split('.') : ['Api']
const graphqlUrl: undefined | string = args._[0]
if (!graphqlUrl) {
  console.log(usage)
  process.exit(0)
}
const tsDeclarationPath = args.output

const writeWithElmFormat = (path: string, value: string): void => {
  const elmFormat = spawn('./node_modules/.bin/elm-format', [
    '--stdin',
    '--output',
    path
  ])

  elmFormat.stdin.write(value)
  elmFormat.stdin.end()

  elmFormat.stdout.on('data', data => {
    console.log(data.toString())
  })

  elmFormat.stderr.on('data', data => {
    console.log(data.toString())
  })

  elmFormat.on('close', code => {
    if (code !== 0) {
      console.log(`elm-format process exited with code ${code}`)
    }
  })
}

const onDataAvailable = (data: {}) => {
  let app = Elm.Main.worker({ data, baseModule })
  app.ports.generatedFiles.subscribe(function(generatedFile: any) {
    fs.mkdirpSync(`./src/${baseModule.join('/')}/Object`)
    fs.mkdirpSync(`./src/${baseModule.join('/')}/Enum`)
    for (let key in generatedFile) {
      let path = './src/' + key
      let value = generatedFile[key]
      writeWithElmFormat(path, value)
    }
  })
}
const introspectionQuery = `{
    __schema {
      queryType {
        name
      }
      mutationType {
        name
      }
      types {
        ...FullType
      }
    }
  }

  fragment FullType on __Type {
    kind
    name
    description
    fields(includeDeprecated: true) {
      name
      description
      args {
        ...InputValue
      }
      type {
        ...TypeRef
      }
      isDeprecated
      deprecationReason
    }
    inputFields {
      ...InputValue
    }
    interfaces {
      ...TypeRef
    }
    enumValues(includeDeprecated: true) {
      name
      description
      isDeprecated
      deprecationReason
    }
    possibleTypes {
      ...TypeRef
    }
  }

  fragment InputValue on __InputValue {
    name
    description
    type { ...TypeRef }
    defaultValue
  }

  fragment TypeRef on __Type {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                }
              }
            }
          }
        }
      }
    }
  }`
new GraphQLClient(graphqlUrl, {
  mode: 'cors',
  headers: headers
})
  .request(introspectionQuery)
  .then(data => {
    onDataAvailable(data)
  })
  .catch(err => {
    console.log('error', err)
    process.exit(1)
  })
