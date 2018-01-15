-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.ReleaseOrder exposing (..)

import Github.Enum.OrderDirection
import Github.Enum.ReleaseOrderField
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


{-| Encode a ReleaseOrder into a value that can be used as an argument.
-}
encode : ReleaseOrder -> Value
encode input =
    Encode.maybeObject
        [ ( "field", Encode.enum Github.Enum.ReleaseOrderField.toString input.field |> Just ), ( "direction", Encode.enum Github.Enum.OrderDirection.toString input.direction |> Just ) ]


{-| Type for the ReleaseOrder input object.
-}
type alias ReleaseOrder =
    { field : Github.Enum.ReleaseOrderField.ReleaseOrderField, direction : Github.Enum.OrderDirection.OrderDirection }
