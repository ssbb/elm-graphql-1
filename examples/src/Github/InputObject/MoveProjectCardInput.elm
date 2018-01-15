-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.MoveProjectCardInput exposing (..)

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


{-| Encode a MoveProjectCardInput into a value that can be used as an argument.
-}
encode : MoveProjectCardInput -> Value
encode input =
    Encode.maybeObject
        [ ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ), ( "cardId", (\(Github.Scalar.Id raw) -> Encode.string raw) input.cardId |> Just ), ( "columnId", (\(Github.Scalar.Id raw) -> Encode.string raw) input.columnId |> Just ), ( "afterCardId", (\(Github.Scalar.Id raw) -> Encode.string raw) |> Encode.optional input.afterCardId ) ]


{-| Type for the MoveProjectCardInput input object.
-}
type alias MoveProjectCardInput =
    { clientMutationId : OptionalArgument String, cardId : Github.Scalar.Id, columnId : Github.Scalar.Id, afterCardId : OptionalArgument Github.Scalar.Id }
