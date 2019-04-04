module Pages.Rules exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Widgets exposing (..)


view =
    section [ class "container" ]
        [ row
            [ box "col-xs-12 col-md-offset-2 col-md-8 page-hero"
                [ h1 [] [ text "Sesizează orice incident" ]
                ]
            ]
        ]
