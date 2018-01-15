-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.AddPullRequestReviewInput exposing (..)

import Github.Enum.PullRequestReviewEvent
import Github.InputObject.DraftPullRequestReviewComment
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


{-| Encode a AddPullRequestReviewInput into a value that can be used as an argument.
-}
encode : AddPullRequestReviewInput -> Value
encode input =
    Encode.maybeObject
        [ ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ), ( "pullRequestId", (\(Github.Scalar.Id raw) -> Encode.string raw) input.pullRequestId |> Just ), ( "commitOID", (\(Github.Scalar.GitObjectID raw) -> Encode.string raw) |> Encode.optional input.commitOID ), ( "body", Encode.string |> Encode.optional input.body ), ( "event", Encode.enum Github.Enum.PullRequestReviewEvent.toString |> Encode.optional input.event ), ( "comments", (Github.InputObject.DraftPullRequestReviewComment.encode |> Encode.maybe |> Encode.list) |> Encode.optional input.comments ) ]


{-| Type for the AddPullRequestReviewInput input object.
-}
type alias AddPullRequestReviewInput =
    { clientMutationId : OptionalArgument String, pullRequestId : Github.Scalar.Id, commitOID : OptionalArgument Github.Scalar.GitObjectID, body : OptionalArgument String, event : OptionalArgument Github.Enum.PullRequestReviewEvent.PullRequestReviewEvent, comments : OptionalArgument (List (Maybe Github.InputObject.DraftPullRequestReviewComment.DraftPullRequestReviewComment)) }
