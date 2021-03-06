module Route exposing (Page(..), allPages, fromUrl, href, pageToString)

import Html exposing (Attribute)
import Html.Attributes as HA
import I18n exposing (Language)
import Url exposing (Url)
import Url.Parser exposing (Parser, map, oneOf, parse, s, top)


type Page
    = Home
    | Incidents
    | Statistics
    | Rules
    | AboutUs
    | Admin
    | Donate


allPages =
    [ Home, Incidents, Statistics, AboutUs, Donate ]


routeParser : Language -> Parser (Page -> a) a
routeParser lang =
    let
        i18n =
            I18n.i18nPrefix lang "route"
    in
    oneOf
        [ map Home top
        , map Admin (s "admin")
        , map Incidents (s <| i18n "incidents")
        , map Statistics (s <| i18n "statistics")
        , map Rules (s <| i18n "rules")
        , map AboutUs (s <| i18n "aboutUs")
        ]


fromUrl : Language -> Url -> Page
fromUrl lang url =
    parse (routeParser lang) url
        |> Maybe.withDefault Home


href : Language -> Page -> Attribute msg
href trans page =
    let
        i18n =
            I18n.i18nPrefix trans "route"
    in
    HA.href <|
        case page of
            Home ->
                "/"

            Admin ->
                "/admin"

            Incidents ->
                i18n "incidents"

            Statistics ->
                i18n "statistics"

            Rules ->
                i18n "rules"

            AboutUs ->
                i18n "aboutUs"

            Donate ->
                i18n "donate"


pageToString : Language -> Page -> String
pageToString lang page =
    let
        i18n =
            I18n.i18nPrefix lang "nav"
    in
    case page of
        Admin ->
            i18n "admin"

        Home ->
            i18n "home"

        Incidents ->
            i18n "incidents"

        Statistics ->
            i18n "statistics"

        Rules ->
            i18n "rules"

        AboutUs ->
            i18n "aboutUs"

        Donate ->
            i18n "donate"
