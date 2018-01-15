-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.CodeOfConduct exposing (..)

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


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.CodeOfConduct
selection constructor =
    Object.selection constructor


{-| The body of the CoC
-}
body : Field (Maybe String) Github.Object.CodeOfConduct
body =
    Object.fieldDecoder "body" [] (Decode.string |> Decode.maybe)


{-| The key for the CoC
-}
key : Field String Github.Object.CodeOfConduct
key =
    Object.fieldDecoder "key" [] Decode.string


{-| The formal name of the CoC
-}
name : Field String Github.Object.CodeOfConduct
name =
    Object.fieldDecoder "name" [] Decode.string


{-| The path to the CoC
-}
url : Field (Maybe Github.Scalar.Uri) Github.Object.CodeOfConduct
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.map Github.Scalar.Uri |> Decode.maybe)
