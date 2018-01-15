-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.DraftPullRequestReviewComment exposing (..)

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


{-| Encode a DraftPullRequestReviewComment into a value that can be used as an argument.
-}
encode : DraftPullRequestReviewComment -> Value
encode input =
    Encode.maybeObject
        [ ( "path", Encode.string input.path |> Just ), ( "position", Encode.int input.position |> Just ), ( "body", Encode.string input.body |> Just ) ]


{-| Type for the DraftPullRequestReviewComment input object.
-}
type alias DraftPullRequestReviewComment =
    { path : String, position : Int, body : String }
