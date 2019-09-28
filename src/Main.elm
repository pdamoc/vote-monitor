module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Data.Context as Context exposing (Context)
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, id, target)
import I18n
import Pages.AboutUs as AboutUs
import Pages.Home as Home
import Pages.Incidents as Incidents
import Pages.Login as Login
import Pages.Rules as Rules
import Pages.Statistics as Statistics
import Route exposing (Page(..))
import Ui exposing (..)
import Url



-- MAIN


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Flags =
    { jwt : String }


type alias Model =
    { key : Nav.Key
    , currentPage : Page
    , context : Context

    -- Page Models
    , incidents : Incidents.Model
    , login : Login.Model
    }


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        context =
            Context.init
    in
    ( { key = key
      , currentPage = Route.fromUrl context.lang url
      , context = context

      -- Page Models
      , incidents = Incidents.init
      , login = Login.init
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
      -- Page Msgs
    | IncidentsMsg Incidents.Msg
    | LoginMsg Login.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | currentPage = Route.fromUrl model.context.lang url }
            , Cmd.none
            )

        -- Page Msgs
        IncidentsMsg iMsg ->
            ( { model | incidents = Incidents.update iMsg model.incidents }
            , Cmd.none
            )

        LoginMsg iMsg ->
            let
                ( newlogin, cmd ) =
                    Login.update iMsg model.login
            in
            ( { model | login = newlogin }
            , Cmd.map LoginMsg cmd
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view ({ context } as model) =
    { title = I18n.i18n context.lang "app.title"
    , body =
        [ viewHeader model
        , viewMain model
        , viewFooter
        ]
    }


viewHeader : Model -> Html Msg
viewHeader ({ context } as model) =
    let
        i18n =
            I18n.i18n context.lang

        toItem page =
            li []
                [ if page == Donate then
                    a
                        [ classList [ ( "second", page == Donate ) ]
                        , selected (page == model.currentPage)
                        , href (i18n "donate.link")
                        , target "_blank"
                        ]
                        [ text (Route.pageToString model.context.lang page) ]

                  else
                    a
                        [ classList [ ( "second", page == Donate ) ]
                        , selected (page == model.currentPage)
                        , Route.href context.lang page
                        ]
                        [ text (Route.pageToString model.context.lang page) ]
                ]

        menu =
            List.map toItem Route.allPages
                |> ul [ id "menu-list" ]
    in
    header []
        [ container
            [ row
                [ box "col-xs-12" [ a [ class "brand", href "/" ] [ logo ], menu ] ]
            ]
        ]


viewFooter : Html Msg
viewFooter =
    footer []
        [ container
            [ row
                [ box "col-xs-12 col-md-5"
                    [ box "bottom-icons mb-2"
                        [ a [ href "/login" ] [ box "svg-icon-lg" [ voteMonitorCircleIcon ] ]
                        , a
                            [ class "m-2"
                            , href "https://github.com/code4romania/monitorizare-vot-votanti-client/"
                            , target "_blank"
                            ]
                            [ box "svg-icon " [ github ], text " / client" ]
                        , a
                            [ class "m-2"
                            , href "https://github.com/code4romania/monitorizare-vot-votanti-api/"
                            , target "_blank"
                            ]
                            [ box "svg-icon " [ github ], text " / api" ]
                        ]
                    , p []
                        [ span [] [ text "Pentru întrebări, scrie-ne la " ]
                        , a [ href "mailto:monitorizarevot@code4.ro" ] [ text "monitorizarevot@code4.ro" ]
                        ]
                    ]
                , box "col-xs-12 col-md-offset-1 col-md-6 copyright"
                    [ a [ href "https://code4.ro/", target "_blank" ] [ box "svg-icon-lg" [ code4Logo ] ]
                    , p []
                        [ text "© 2019 Code for Romania."
                        , br [] []
                        , text "Organizație neguvernamentală independentă, neafiliată politic și apolitică."
                        ]
                    ]
                ]
            ]
        ]


viewMain : Model -> Html Msg
viewMain ({ currentPage, context } as model) =
    let
        viewPage pageView pageModel lift =
            pageView context pageModel |> Html.map lift

        content =
            case currentPage of
                Home ->
                    Home.view context

                Login ->
                    viewPage Login.view model.login LoginMsg

                Incidents ->
                    viewPage Incidents.view model.incidents IncidentsMsg

                Statistics ->
                    Statistics.view context

                Rules ->
                    Rules.view context

                AboutUs ->
                    AboutUs.view context

                Donate ->
                    Home.view context
    in
    main_ [] [ content ]
