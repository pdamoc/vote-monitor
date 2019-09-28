module Pages.Home exposing (view)

import Data.Context exposing (Context)
import Html exposing (..)
import Html.Attributes exposing (..)
import I18n
import Route exposing (..)
import Widgets exposing (..)


view context =
    let
        iTxt =
            I18n.i18nTextPrefix context.lang "pages.home"
    in
    section [ class "container" ]
        [ row
            [ box "col-xs-12 col-md-offset-2 col-md-8 page-hero"
                [ h1 [] [ iTxt "title" ]
                , p [] [ iTxt "first" ]
                , a [ class "button", Route.href context.lang Incidents ] [ iTxt "first.button", arrowRight ]
                ]
            ]
        ]
