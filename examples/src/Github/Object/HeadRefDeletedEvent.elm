-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.HeadRefDeletedEvent exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.HeadRefDeletedEvent
selection constructor =
    Object.selection constructor


{-| Identifies the actor who performed the event.
-}
actor : SelectionSet selection Github.Interface.Actor -> Field (Maybe selection) Github.Object.HeadRefDeletedEvent
actor object =
    Object.selectionField "actor" [] object (identity >> Decode.maybe)


{-| Identifies the date and time when the object was created.
-}
createdAt : Field Github.Scalar.DateTime Github.Object.HeadRefDeletedEvent
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map Github.Scalar.DateTime)


{-| Identifies the Ref associated with the `head_ref_deleted` event.
-}
headRef : SelectionSet selection Github.Object.Ref -> Field (Maybe selection) Github.Object.HeadRefDeletedEvent
headRef object =
    Object.selectionField "headRef" [] object (identity >> Decode.maybe)


{-| Identifies the name of the Ref associated with the `head_ref_deleted` event.
-}
headRefName : Field String Github.Object.HeadRefDeletedEvent
headRefName =
    Object.fieldDecoder "headRefName" [] Decode.string


id : Field Github.Scalar.Id Github.Object.HeadRefDeletedEvent
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| PullRequest referenced by event.
-}
pullRequest : SelectionSet selection Github.Object.PullRequest -> Field selection Github.Object.HeadRefDeletedEvent
pullRequest object =
    Object.selectionField "pullRequest" [] object identity
