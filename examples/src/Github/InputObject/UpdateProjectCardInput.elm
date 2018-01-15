-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.UpdateProjectCardInput exposing (..)

import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Encode a UpdateProjectCardInput into a value that can be used as an argument.
-}
encode : UpdateProjectCardInput -> Value
encode input =
    Encode.maybeObject
        [ ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ), ( "projectCardId", (\(Github.Scalar.Id raw) -> Encode.string raw) input.projectCardId |> Just ), ( "note", Encode.string input.note |> Just ) ]


{-| Type for the UpdateProjectCardInput input object.
-}
type alias UpdateProjectCardInput =
    { clientMutationId : OptionalArgument String, projectCardId : Github.Scalar.Id, note : String }
