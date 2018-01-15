-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.Release exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Release
selection constructor =
    Object.selection constructor


{-| The author of the release
-}
author : SelectionSet selection Github.Object.User -> Field (Maybe selection) Github.Object.Release
author object =
    Object.selectionField "author" [] object (identity >> Decode.maybe)


{-| Identifies the date and time when the object was created.
-}
createdAt : Field Github.Scalar.DateTime Github.Object.Release
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map Github.Scalar.DateTime)


{-| Identifies the description of the release.
-}
description : Field (Maybe String) Github.Object.Release
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.maybe)


id : Field Github.Scalar.Id Github.Object.Release
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| Whether or not the release is a draft
-}
isDraft : Field Bool Github.Object.Release
isDraft =
    Object.fieldDecoder "isDraft" [] Decode.bool


{-| Whether or not the release is a prerelease
-}
isPrerelease : Field Bool Github.Object.Release
isPrerelease =
    Object.fieldDecoder "isPrerelease" [] Decode.bool


{-| Identifies the title of the release.
-}
name : Field (Maybe String) Github.Object.Release
name =
    Object.fieldDecoder "name" [] (Decode.string |> Decode.maybe)


{-| Identifies the date and time when the release was created.
-}
publishedAt : Field (Maybe Github.Scalar.DateTime) Github.Object.Release
publishedAt =
    Object.fieldDecoder "publishedAt" [] (Decode.string |> Decode.map Github.Scalar.DateTime |> Decode.maybe)


{-| List of releases assets which are dependent on this release.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - name - A list of names to filter the assets by.

-}
releaseAssets : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, name : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, name : OptionalArgument String }) -> SelectionSet selection Github.Object.ReleaseAssetConnection -> Field selection Github.Object.Release
releaseAssets fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, name = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "name" filledInOptionals.name Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "releaseAssets" optionalArgs object identity


{-| The HTTP path for this issue
-}
resourcePath : Field Github.Scalar.Uri Github.Object.Release
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The Git tag the release points to
-}
tag : SelectionSet selection Github.Object.Ref -> Field (Maybe selection) Github.Object.Release
tag object =
    Object.selectionField "tag" [] object (identity >> Decode.maybe)


{-| The HTTP URL for this issue
-}
url : Field Github.Scalar.Uri Github.Object.Release
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.map Github.Scalar.Uri)
