-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Swapi.Interface.Character exposing (appearsIn, avatarUrl, commonSelection, completeAndCommonSelection, friends, id, maybeFragments, name, onDroid, onHuman, selection)

import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode
import Swapi.Enum.Episode
import Swapi.InputObject
import Swapi.Interface
import Swapi.Object
import Swapi.Scalar
import Swapi.Union


{-| Select only common fields from the interface.
-}
commonSelection : (a -> constructor) -> SelectionSet (a -> constructor) Swapi.Interface.Character
commonSelection constructor =
    Object.selection constructor


{-| Select both common and type-specific fields from the interface.
-}
selection :
    (Maybe typeSpecific -> a -> constructor)
    -> List (FragmentSelectionSet typeSpecific Swapi.Interface.Character)
    -> SelectionSet (a -> constructor) Swapi.Interface.Character
selection constructor typeSpecificDecoders =
    Object.interfaceSelection typeSpecificDecoders constructor


{-| Complete selection
-}
completeSelection :
    Fragments decodesTo
    -> SelectionSet decodesTo Swapi.Interface.Character
completeSelection selections =
    Object.exhuastiveFragmentSelection
        [ onDroid selections.onDroid
        , onHuman selections.onHuman
        ]


type alias Fragments decodesTo =
    { onDroid : SelectionSet decodesTo Swapi.Object.Droid
    , onHuman : SelectionSet decodesTo Swapi.Object.Human
    }


maybeFragments : Fragments (Maybe a)
maybeFragments =
    { onDroid = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onHuman = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| Complete selection
-}
completeAndCommonSelection :
    (decodesTo -> a -> constructor)
    ->
        { onDroid : SelectionSet decodesTo Swapi.Object.Droid
        , onHuman : SelectionSet decodesTo Swapi.Object.Human
        }
    -> SelectionSet (a -> constructor) Swapi.Interface.Character
completeAndCommonSelection constructor selections =
    Object.exhuastiveAndCommonFragmentSelection constructor
        [ onDroid selections.onDroid
        , onHuman selections.onHuman
        ]


onHuman : SelectionSet decodesTo Swapi.Object.Human -> FragmentSelectionSet decodesTo Swapi.Interface.Character
onHuman (SelectionSet fields decoder) =
    FragmentSelectionSet "Human" fields decoder


onDroid : SelectionSet decodesTo Swapi.Object.Droid -> FragmentSelectionSet decodesTo Swapi.Interface.Character
onDroid (SelectionSet fields decoder) =
    FragmentSelectionSet "Droid" fields decoder


{-| Which movies they appear in.
-}
appearsIn : Field (List Swapi.Enum.Episode.Episode) Swapi.Interface.Character
appearsIn =
    Object.fieldDecoder "appearsIn" [] (Swapi.Enum.Episode.decoder |> Decode.list)


{-| Url to a profile picture for the character.
-}
avatarUrl : Field String Swapi.Interface.Character
avatarUrl =
    Object.fieldDecoder "avatarUrl" [] Decode.string


{-| The friends of the character, or an empty list if they have none.
-}
friends : SelectionSet decodesTo Swapi.Interface.Character -> Field (List decodesTo) Swapi.Interface.Character
friends object_ =
    Object.selectionField "friends" [] object_ (identity >> Decode.list)


{-| The ID of the character.
-}
id : Field Swapi.Scalar.Id Swapi.Interface.Character
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Swapi.Scalar.Id)


{-| The name of the character.
-}
name : Field String Swapi.Interface.Character
name =
    Object.fieldDecoder "name" [] Decode.string
