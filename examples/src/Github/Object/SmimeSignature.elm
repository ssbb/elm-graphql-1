-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.SmimeSignature exposing (..)

import Github.Enum.GitSignatureState
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.SmimeSignature
selection constructor =
    Object.selection constructor


{-| Email used to sign this object.
-}
email : Field String Github.Object.SmimeSignature
email =
    Object.fieldDecoder "email" [] Decode.string


{-| True if the signature is valid and verified by GitHub.
-}
isValid : Field Bool Github.Object.SmimeSignature
isValid =
    Object.fieldDecoder "isValid" [] Decode.bool


{-| Payload for GPG signing object. Raw ODB object without the signature header.
-}
payload : Field String Github.Object.SmimeSignature
payload =
    Object.fieldDecoder "payload" [] Decode.string


{-| ASCII-armored signature header from object.
-}
signature : Field String Github.Object.SmimeSignature
signature =
    Object.fieldDecoder "signature" [] Decode.string


{-| GitHub user corresponding to the email signing this commit.
-}
signer : SelectionSet selection Github.Object.User -> Field (Maybe selection) Github.Object.SmimeSignature
signer object =
    Object.selectionField "signer" [] object (identity >> Decode.maybe)


{-| The state of this signature. `VALID` if signature is valid and verified by GitHub, otherwise represents reason why signature is considered invalid.
-}
state : Field Github.Enum.GitSignatureState.GitSignatureState Github.Object.SmimeSignature
state =
    Object.fieldDecoder "state" [] Github.Enum.GitSignatureState.decoder
