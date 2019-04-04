module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Data.Context as Context exposing (Context)
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, id, target)
import Pages.AboutUs as AboutUs
import Pages.Home as Home
import Pages.Incidents as Incidents
import Pages.Rules as Rules
import Pages.Statistics as Statistics
import Route exposing (Page(..))
import Url
import Widgets exposing (..)



-- MAIN


main : Program () Model Msg
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


type alias Model =
    { key : Nav.Key
    , currentPage : Page
    , context : Context
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        context =
            Context.init
    in
    ( { key = key
      , currentPage = Route.fromUrl context.i18n url
      , context = context
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


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
            ( { model | currentPage = Route.fromUrl model.context.i18n url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view ({ context } as model) =
    { title = context.i18n.name
    , body =
        [ viewHeader model
        , viewMain model
        , viewFooter
        ]
    }


viewHeader : Model -> Html Msg
viewHeader ({ context } as model) =
    let
        toItem page =
            li []
                [ if page == Donate then
                    a
                        [ classList [ ( "second", page == Donate ) ]
                        , selected (page == model.currentPage)
                        , href context.i18n.donateLink
                        , target "_blank"
                        ]
                        [ text (Route.pageToString model.context.i18n page) ]

                  else
                    a
                        [ classList [ ( "second", page == Donate ) ]
                        , selected (page == model.currentPage)
                        , Route.href context.i18n page
                        ]
                        [ text (Route.pageToString model.context.i18n page) ]
                ]

        menu =
            List.map toItem Route.allPages
                |> ul [ id "menu-list" ]
    in
    header []
        [ container
            [ row
                [ box "col-xs-12" [ box "brand" [ logo ], menu ] ]
            ]
        ]


viewFooter : Html Msg
viewFooter =
    footer []
        [ container
            [ row
                [ box "col-xs-12 col-md-5"
                    [ box "bottom-icons mb-2"
                        [ a [ href "/" ] [ box "svg-icon-lg" [ voteMonitorCircleIcon ] ]
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
                        [ text "© 2018 Code for Romania."
                        , br [] []
                        , text "Organizație neguvernamentală independentă, neafiliată politic și apolitică."
                        ]
                    ]
                ]
            ]
        ]


viewMain : Model -> Html Msg
viewMain model =
    let
        content =
            case model.currentPage of
                Home ->
                    Home.view

                Incidents ->
                    Incidents.view

                Statistics ->
                    Statistics.view

                Rules ->
                    Rules.view

                AboutUs ->
                    AboutUs.view

                Donate ->
                    Home.view
    in
    main_ [] [ content ]
