module Pages.Incidents exposing (Model, Msg, init, update, view)

import Data.Context exposing (Context)
import Data.Filter as Filter exposing (Filter(..))
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (..)
import I18n
import Ui exposing (..)



-- MODEL


type alias Model =
    { filter : Filter }


init : Model
init =
    { filter = Country "" "" }



-- UPDATE


type Msg
    = ChangeFilter Filter


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeFilter filter ->
            { model | filter = filter }



-- VIEW


view : Context -> Model -> Html Msg
view context model =
    let
        lang =
            I18n.i18n context.lang

        iTxt =
            I18n.i18nTextPrefix context.lang "pages.incidents"
    in
    box ""
        [ section [ class "container" ]
            [ row
                [ box "col-xs-12 col-md-offset-2 col-md-8 page-hero"
                    [ h1 [] [ iTxt "title" ]
                    , p [] [ iTxt "first" ]
                    ]
                ]
            ]
        , section [ class "incidents-filter" ]
            [ row
                [ countryButton lang
                    (ChangeFilter <| Country (Filter.incidentType model.filter) "")
                    (Filter.isSelected model.filter (Country "" ""))
                , worldButton lang
                    (ChangeFilter <| Diaspora (Filter.incidentType model.filter))
                    (Filter.isSelected model.filter (Diaspora ""))
                ]
            ]
        , section [ class "results" ] []
        ]
