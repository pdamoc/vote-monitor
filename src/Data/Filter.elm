module Data.Filter exposing (Filter(..), incidentType, isSelected)


type Filter
    = Country String String
    | Diaspora String


incidentType : Filter -> String
incidentType filter =
    case filter of
        Country iType _ ->
            iType

        Diaspora iType ->
            iType


isSelected : Filter -> Filter -> Bool
isSelected a b =
    case ( a, b ) of
        ( Country _ _, Country _ _ ) ->
            True

        ( Diaspora _, Diaspora _ ) ->
            True

        _ ->
            False
