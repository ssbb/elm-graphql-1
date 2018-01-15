-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.AddProjectCardInput exposing (..)

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


{-| Encode a AddProjectCardInput into a value that can be used as an argument.
-}
encode : AddProjectCardInput -> Value
encode input =
    Encode.maybeObject
        [ ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ), ( "projectColumnId", (\(Github.Scalar.Id raw) -> Encode.string raw) input.projectColumnId |> Just ), ( "contentId", (\(Github.Scalar.Id raw) -> Encode.string raw) |> Encode.optional input.contentId ), ( "note", Encode.string |> Encode.optional input.note ) ]


{-| Type for the AddProjectCardInput input object.
-}
type alias AddProjectCardInput =
    { clientMutationId : OptionalArgument String, projectColumnId : Github.Scalar.Id, contentId : OptionalArgument Github.Scalar.Id, note : OptionalArgument String }
