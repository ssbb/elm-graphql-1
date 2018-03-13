module Graphqelm.Generator.InputObjectFile.Constructor exposing (generate)

import Graphqelm.Generator.Context exposing (Context)
import Graphqelm.Generator.Decoder as Decoder
import Graphqelm.Generator.InputObjectFile.Details exposing (InputObjectDetails)
import Graphqelm.Parser.CamelCaseName as CamelCaseName exposing (CamelCaseName)
import Graphqelm.Parser.ClassCaseName as ClassCaseName exposing (ClassCaseName)
import Graphqelm.Parser.Type as Type exposing (TypeDefinition(TypeDefinition))
import String.Interpolate exposing (interpolate)


generate : Context -> InputObjectDetails -> String
generate context { name, fields, hasLoop } =
    let
        optionalFields =
            fields
                |> List.filter
                    (\field ->
                        case field.typeRef of
                            Type.TypeReference referrableType isNullable ->
                                isNullable == Type.Nullable
                    )

        requiredFields =
            fields
                |> List.filter
                    (\field ->
                        case field.typeRef of
                            Type.TypeReference referrableType isNullable ->
                                isNullable == Type.NonNullable
                    )

        allValues =
            fields
                |> List.map
                    (\field ->
                        interpolate "{0} = {1}.{0}"
                            [ CamelCaseName.normalized field.name
                            , case field.typeRef of
                                Type.TypeReference referrableType isNullable ->
                                    case isNullable of
                                        Type.Nullable ->
                                            "optionals"

                                        Type.NonNullable ->
                                            "required"
                            ]
                    )
                |> String.join ", "
    in
    interpolate
        """
build{0} : ({0}OptionalFields -> {0}OptionalFields) -> {0}RequiredFields -> {0}
build{0} fillOptionals required =
    let
        optionals =
            fillOptionals
                { {1} }
    in
    { {2} }


type alias {0}RequiredFields =
    { {3} }


type alias {0}OptionalFields =
    { {4} }
  """
        [ ClassCaseName.normalized name
        , filledOptionalsRecord optionalFields
        , allValues
        , List.map (aliasEntry context) requiredFields |> String.join ", "
        , List.map (aliasEntry context) optionalFields |> String.join ", "
        ]


filledOptionalsRecord : List Type.Field -> String
filledOptionalsRecord optionalFields =
    optionalFields
        |> List.map .name
        |> List.map (\fieldName -> CamelCaseName.normalized fieldName ++ " = Absent")
        |> String.join ", "


aliasEntry : Context -> Type.Field -> String
aliasEntry { apiSubmodule } field =
    interpolate "{0} : {1}"
        [ CamelCaseName.normalized field.name
        , Decoder.generateTypeForInputObject apiSubmodule field.typeRef
        ]
