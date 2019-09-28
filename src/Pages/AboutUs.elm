module Pages.AboutUs exposing (view)

import Data.Context exposing (Context)
import Html exposing (..)
import Html.Attributes exposing (..)
import I18n
import Markdown exposing (defaultOptions)
import Ui exposing (..)


view context =
    let
        i18n =
            I18n.i18nPrefix context.lang "pages.aboutUs"

        pageTitle =
            Markdown.toHtmlWith { defaultOptions | sanitize = False } [] (i18n "title")
    in
    section [ class "container" ]
        [ row
            [ box "col-xs-12 col-md-offset-2 col-md-8 page-hero"
                [ pageTitle
                ]
            ]
        ]
