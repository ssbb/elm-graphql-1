-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.Team exposing (..)

import Github.Enum.SubscriptionState
import Github.Enum.TeamMemberRole
import Github.Enum.TeamMembershipType
import Github.Enum.TeamPrivacy
import Github.InputObject.TeamOrder
import Github.InputObject.TeamRepositoryOrder
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Team
selection constructor =
    Object.selection constructor


{-| A list of teams that are ancestors of this team.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
ancestors : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet selection Github.Object.TeamConnection -> Field selection Github.Object.Team
ancestors fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "ancestors" optionalArgs object identity


{-| List of child teams belonging to this team

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - orderBy - Order for connection
  - userLogins - User logins to filter by
  - immediateOnly - Whether to list immediate child teams or all descendant child teams.

-}
childTeams : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, orderBy : OptionalArgument Github.InputObject.TeamOrder.TeamOrder, userLogins : OptionalArgument (List String), immediateOnly : OptionalArgument Bool } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, orderBy : OptionalArgument Github.InputObject.TeamOrder.TeamOrder, userLogins : OptionalArgument (List String), immediateOnly : OptionalArgument Bool }) -> SelectionSet selection Github.Object.TeamConnection -> Field selection Github.Object.Team
childTeams fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, orderBy = Absent, userLogins = Absent, immediateOnly = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.TeamOrder.encode, Argument.optional "userLogins" filledInOptionals.userLogins (Encode.string |> Encode.list), Argument.optional "immediateOnly" filledInOptionals.immediateOnly Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionField "childTeams" optionalArgs object identity


{-| The slug corresponding to the organization and team.
-}
combinedSlug : Field String Github.Object.Team
combinedSlug =
    Object.fieldDecoder "combinedSlug" [] Decode.string


{-| Identifies the date and time when the object was created.
-}
createdAt : Field Github.Scalar.DateTime Github.Object.Team
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map Github.Scalar.DateTime)


{-| The description of the team.
-}
description : Field (Maybe String) Github.Object.Team
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.maybe)


{-| The HTTP path for editing this team
-}
editTeamResourcePath : Field Github.Scalar.Uri Github.Object.Team
editTeamResourcePath =
    Object.fieldDecoder "editTeamResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for editing this team
-}
editTeamUrl : Field Github.Scalar.Uri Github.Object.Team
editTeamUrl =
    Object.fieldDecoder "editTeamUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


id : Field Github.Scalar.Id Github.Object.Team
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| A list of pending invitations for users to this team

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
invitations : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet selection Github.Object.OrganizationInvitationConnection -> Field (Maybe selection) Github.Object.Team
invitations fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "invitations" optionalArgs object (identity >> Decode.maybe)


{-| A list of users who are members of this team.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - query - The search string to look for.
  - membership - Filter by membership type
  - role - Filter by team member role

-}
members : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, query : OptionalArgument String, membership : OptionalArgument Github.Enum.TeamMembershipType.TeamMembershipType, role : OptionalArgument Github.Enum.TeamMemberRole.TeamMemberRole } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, query : OptionalArgument String, membership : OptionalArgument Github.Enum.TeamMembershipType.TeamMembershipType, role : OptionalArgument Github.Enum.TeamMemberRole.TeamMemberRole }) -> SelectionSet selection Github.Object.TeamMemberConnection -> Field selection Github.Object.Team
members fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, query = Absent, membership = Absent, role = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "query" filledInOptionals.query Encode.string, Argument.optional "membership" filledInOptionals.membership (Encode.enum Github.Enum.TeamMembershipType.toString), Argument.optional "role" filledInOptionals.role (Encode.enum Github.Enum.TeamMemberRole.toString) ]
                |> List.filterMap identity
    in
    Object.selectionField "members" optionalArgs object identity


{-| The HTTP path for the team' members
-}
membersResourcePath : Field Github.Scalar.Uri Github.Object.Team
membersResourcePath =
    Object.fieldDecoder "membersResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for the team' members
-}
membersUrl : Field Github.Scalar.Uri Github.Object.Team
membersUrl =
    Object.fieldDecoder "membersUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The name of the team.
-}
name : Field String Github.Object.Team
name =
    Object.fieldDecoder "name" [] Decode.string


{-| The HTTP path creating a new team
-}
newTeamResourcePath : Field Github.Scalar.Uri Github.Object.Team
newTeamResourcePath =
    Object.fieldDecoder "newTeamResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL creating a new team
-}
newTeamUrl : Field Github.Scalar.Uri Github.Object.Team
newTeamUrl =
    Object.fieldDecoder "newTeamUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The organization that owns this team.
-}
organization : SelectionSet selection Github.Object.Organization -> Field selection Github.Object.Team
organization object =
    Object.selectionField "organization" [] object identity


{-| The parent team of the team.
-}
parentTeam : SelectionSet selection Github.Object.Team -> Field (Maybe selection) Github.Object.Team
parentTeam object =
    Object.selectionField "parentTeam" [] object (identity >> Decode.maybe)


{-| The level of privacy the team has.
-}
privacy : Field Github.Enum.TeamPrivacy.TeamPrivacy Github.Object.Team
privacy =
    Object.fieldDecoder "privacy" [] Github.Enum.TeamPrivacy.decoder


{-| A list of repositories this team has access to.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - query - The search string to look for.
  - orderBy - Order for the connection.

-}
repositories : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, query : OptionalArgument String, orderBy : OptionalArgument Github.InputObject.TeamRepositoryOrder.TeamRepositoryOrder } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, query : OptionalArgument String, orderBy : OptionalArgument Github.InputObject.TeamRepositoryOrder.TeamRepositoryOrder }) -> SelectionSet selection Github.Object.TeamRepositoryConnection -> Field selection Github.Object.Team
repositories fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, query = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "query" filledInOptionals.query Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.TeamRepositoryOrder.encode ]
                |> List.filterMap identity
    in
    Object.selectionField "repositories" optionalArgs object identity


{-| The HTTP path for this team's repositories
-}
repositoriesResourcePath : Field Github.Scalar.Uri Github.Object.Team
repositoriesResourcePath =
    Object.fieldDecoder "repositoriesResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for this team's repositories
-}
repositoriesUrl : Field Github.Scalar.Uri Github.Object.Team
repositoriesUrl =
    Object.fieldDecoder "repositoriesUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP path for this team
-}
resourcePath : Field Github.Scalar.Uri Github.Object.Team
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The slug corresponding to the team.
-}
slug : Field String Github.Object.Team
slug =
    Object.fieldDecoder "slug" [] Decode.string


{-| The HTTP path for this team's teams
-}
teamsResourcePath : Field Github.Scalar.Uri Github.Object.Team
teamsResourcePath =
    Object.fieldDecoder "teamsResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for this team's teams
-}
teamsUrl : Field Github.Scalar.Uri Github.Object.Team
teamsUrl =
    Object.fieldDecoder "teamsUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for this team
-}
url : Field Github.Scalar.Uri Github.Object.Team
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| Team is adminable by the viewer.
-}
viewerCanAdminister : Field Bool Github.Object.Team
viewerCanAdminister =
    Object.fieldDecoder "viewerCanAdminister" [] Decode.bool


{-| Check if the viewer is able to change their subscription status for the repository.
-}
viewerCanSubscribe : Field Bool Github.Object.Team
viewerCanSubscribe =
    Object.fieldDecoder "viewerCanSubscribe" [] Decode.bool


{-| Identifies if the viewer is watching, not watching, or ignoring the subscribable entity.
-}
viewerSubscription : Field Github.Enum.SubscriptionState.SubscriptionState Github.Object.Team
viewerSubscription =
    Object.fieldDecoder "viewerSubscription" [] Github.Enum.SubscriptionState.decoder
