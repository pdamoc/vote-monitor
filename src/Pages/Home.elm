module Pages.Home exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Widgets exposing (..)


view =
    section [ class "container" ]
        [ row
            [ box "col-xs-12 col-md-offset-2 col-md-8 page-hero"
                [ h1 [] [ text "Sesizează orice incident" ]
                , p [] [ text "Dacă ai sesizat nereguli în timpul campaniei pentru referendum sau în ziua votului postează aici. Ai văzut mesaje care instigă la ură, ai văzut campanii derulate în mod ilegal sau alte comunicări care contravin principiilor democratice și care atacă drepturile fundamentale ale omului? Trimite o sesizare folosind formularul de mai jos. Mesajul tău va fi astfel public și va putea fi văzut de toți utilizatorii și preluat de autorități sau jurnaliști și investigată mai departe." ]
                ]
            ]
        ]
