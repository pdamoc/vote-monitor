module Route exposing (Page(..), allPages, fromUrl, href, pageToString)

import Html exposing (Attribute)
import Html.Attributes as HA
import I18n exposing (I18n)
import Url exposing (Url)
import Url.Parser exposing (Parser, map, oneOf, parse, s, top)


type Page
    = Home
    | Incidents
    | Statistics
    | Rules
    | AboutUs
    | Donate


allPages =
    [ Home, Incidents, Statistics, Rules, AboutUs, Donate ]


routeParser : I18n -> Parser (Page -> a) a
routeParser i18n =
    oneOf
        [ map Home top
        , map Incidents (s i18n.pages.incidents.path)
        , map Statistics (s i18n.pages.statistics.path)
        , map Rules (s i18n.pages.rules.path)
        , map AboutUs (s i18n.pages.aboutUs.path)
        ]


fromUrl : I18n -> Url -> Page
fromUrl i18n url =
    parse (routeParser i18n) url
        |> Maybe.withDefault Home


href : I18n -> Page -> Attribute msg
href i18n page =
    HA.href <|
        case page of
            Home ->
                "/"

            Incidents ->
                i18n.pages.incidents.path

            Statistics ->
                i18n.pages.statistics.path

            Rules ->
                i18n.pages.rules.path

            AboutUs ->
                i18n.pages.aboutUs.path

            Donate ->
                i18n.pages.donate.path


pageToString : I18n -> Page -> String
pageToString i18n page =
    case page of
        Home ->
            i18n.pages.home.text

        Incidents ->
            i18n.pages.incidents.text

        Statistics ->
            i18n.pages.statistics.text

        Rules ->
            i18n.pages.rules.text

        AboutUs ->
            i18n.pages.aboutUs.text

        Donate ->
            i18n.pages.donate.text
