module I18n exposing (Language, i18n, i18nPrefix, i18nText, i18nTextPrefix)

import Dict exposing (Dict)
import Html exposing (Html)


type alias Language =
    Dict String String


i18n : Language -> String -> String
i18n lang key =
    Dict.get key lang
        |> Maybe.withDefault "***Missing Translation***"


i18nPrefix : Language -> String -> String -> String
i18nPrefix lang prefix key =
    i18n lang (String.join "." [ prefix, key ])


i18nText : Language -> String -> Html msg
i18nText lang =
    i18n lang >> Html.text


i18nTextPrefix : Language -> String -> String -> Html msg
i18nTextPrefix lang prefix =
    i18nPrefix lang prefix >> Html.text
