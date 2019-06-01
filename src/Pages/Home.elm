module Pages.Home exposing (view)

import Data.Context exposing (Context)
import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Page(..))
import Widgets exposing (..)


view : Context -> Html msg
view { i18n } =
    section [ class "container" ]
        [ row
            [ box "col-xs-12 col-md-offset-2 col-md-8 page-hero"
                [ h1 [] [ text "Sesizează orice incident" ]
                , p [] [ text "Pe 26 mai 2019 au loc alegerile europarlamentare și referendumul național pe justiție. Dacă ai sesizat nereguli în timpul campaniei sau în ziua votului postează aici. Ai văzut mesaje care instigă la ură, ai văzut campanii derulate în mod ilegal sau alte comunicări care contravin principiilor democratice, probleme în secția în care ai votat etc? Trimite o sesizare folosind formularul de mai jos." ]
                , box "row center-xs"
                    [ a [ class "btn-primary", Route.href i18n Incidents ] [ span [] [ text "Vezi toate sesizările" ], rightArrow ]
                    ]
                ]
            ]
        ]
