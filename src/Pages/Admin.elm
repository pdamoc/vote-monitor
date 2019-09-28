module Pages.Admin exposing (Model, Msg, init, update, view)

import Data.Context exposing (Context)
import Html exposing (Html, button, div, h1, input, label, text)
import Html.Attributes exposing (class, name, type_)
import Html.Events exposing (onClick, onInput)
import Ui exposing (..)



-- MODEL


type alias Model =
    { email : String, pass : String }


init : Model
init =
    { email = "", pass = "" }



-- UPDATE


type Msg
    = Email String
    | Pass String
    | Login


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Email email ->
            ( { model | email = email }, Cmd.none )

        Pass pass ->
            ( { model | pass = pass }, Cmd.none )

        Login ->
            ( model, Cmd.none )



-- VIEW


login model =
    box "login-card form-group"
        [ label [] [ text "Email" ]
        , input [ name "email" ] []
        , label [] [ text "Password" ]
        , input [ type_ "password", name "password" ] []
        , button [] [ text "Login" ]
        ]


adminView model =
    h1 [] [ text "Hello NGO" ]


view : Context -> Model -> Html Msg
view context model =
    let
        content =
            case context.jwt of
                Nothing ->
                    login model

                Just _ ->
                    adminView model
    in
    box "d-flex align-items-center justify-content-around"
        [ content
        ]
