module Ui exposing
    ( arrowRight
    , box
    , code4Logo
    , container
    , countryButton
    , github
    , logo
    , row
    , selected
    , voteMonitorCircleIcon
    , worldButton
    )

import Html exposing (Attribute, Html, button, div, img, text)
import Html.Attributes exposing (attribute, class, property, src)
import Html.Events exposing (onClick)
import I18n exposing (Language)
import Json.Decode as Json
import Json.Encode as JEnc
import Svg exposing (Svg)
import Svg.Attributes as SA


box : String -> List (Html msg) -> Html msg
box cls =
    div [ class cls ]


row : List (Html msg) -> Html msg
row =
    box "row"


container : List (Html msg) -> Html msg
container =
    box "container"


selected : Bool -> Attribute msg
selected isSelected =
    if isSelected then
        attribute "selected" ""

    else
        property "none" (JEnc.bool False)


logo : Svg msg
logo =
    Svg.svg
        [ SA.version "1.1", SA.id "icon-mv", SA.x "0px", SA.y "0px", SA.viewBox "-263 386.9 68 68" ]
        [ Svg.g []
            [ Svg.path
                [ SA.d "M-258.4,431.7h22.7l-11.4-19.6L-258.4,431.7z M-231.1,434.3H-263l16-27.6L-231.1,434.3z" ]
                []
            , Svg.path
                [ SA.d "M-241.6,431.7h22.7l-11.4-19.6L-241.6,431.7z M-214.3,434.3h-32l16-27.6L-214.3,434.3z" ]
                []
            , Svg.path
                [ SA.d "M-222.4,409.4L-211,429l11.4-19.6H-222.4z M-211,434.3l-16-27.6h32L-211,434.3z" ]
                []
            ]
        ]


voteMonitorCircleIcon : Svg msg
voteMonitorCircleIcon =
    Svg.svg
        [ SA.version "1.1", SA.id "icon-mv-circle", SA.x "0px", SA.y "0px", SA.viewBox "-263 386.9 68 68" ]
        [ Svg.g
            []
            [ Svg.path
                [ SA.d "M-251.2,429.1h17.3l-8.6-14.9L-251.2,429.1z M-230.4,431.1h-24.3l12.2-21L-230.4,431.1z" ]
                []
            , Svg.path
                [ SA.d "M-238.4,429.1h17.3l-8.6-14.9L-238.4,429.1z M-217.6,431.1H-242l12.2-21L-217.6,431.1z" ]
                []
            , Svg.path
                [ SA.d "M-223.8,412.1l8.6,14.9l8.6-14.9H-223.8z M-215.2,431.1l-12.2-21h24.4L-215.2,431.1z" ]
                []
            , Svg.path
                [ SA.d "M-228.9,389c-17.5,0.1-31.6,14.3-31.5,31.8c0.1,17.5,14.3,31.6,31.8,31.5c17.4-0.1,31.5-14.2,31.5-31.6C-197.2,403.1-211.4,388.9-228.9,389 M-228.9,454.2c-18.6-0.1-33.5-15.2-33.4-33.8c0.1-18.6,15.2-33.5,33.8-33.4c18.5,0.1,33.4,15.1,33.4,33.6C-195.2,439.2-210.3,454.2-228.9,454.2" ]
                []
            ]
        ]


github : Svg msg
github =
    Svg.svg
        [ SA.viewBox "0 0 16 16", SA.fillRule "evenodd", SA.clipRule "evenodd", SA.strokeLinejoin "round", SA.strokeMiterlimit "1.414" ]
        [ Svg.path
            [ SA.d "M8 0C3.58 0 0 3.582 0 8c0 3.535 2.292 6.533 5.47 7.59.4.075.547-.172.547-.385 0-.19-.007-.693-.01-1.36-2.226.483-2.695-1.073-2.695-1.073-.364-.924-.89-1.17-.89-1.17-.725-.496.056-.486.056-.486.803.056 1.225.824 1.225.824.714 1.223 1.873.87 2.33.665.072-.517.278-.87.507-1.07-1.777-.2-3.644-.888-3.644-3.953 0-.873.31-1.587.823-2.147-.083-.202-.358-1.015.077-2.117 0 0 .672-.215 2.2.82.638-.178 1.323-.266 2.003-.27.68.004 1.364.092 2.003.27 1.527-1.035 2.198-.82 2.198-.82.437 1.102.163 1.915.08 2.117.513.56.823 1.274.823 2.147 0 3.073-1.87 3.75-3.653 3.947.287.246.543.735.543 1.48 0 1.07-.01 1.933-.01 2.195 0 .215.144.463.55.385C13.71 14.53 16 11.534 16 8c0-4.418-3.582-8-8-8" ]
            []
        ]


code4Logo : Svg msg
code4Logo =
    Svg.svg
        [ SA.version "1.1", SA.id "icon-code4", SA.x "0px", SA.y "0px", SA.viewBox "0 0 175.67 146.83" ]
        [ Svg.g
            []
            [ Svg.polygon
                [ SA.points "166.42 74.27 124.6 4.48 89.31 0 89.28 0 88.89 70.83 166.42 74.27", SA.style "opacity: 0.05; isolation: isolate;" ]
                []
            , Svg.polygon
                [ SA.points "88.89 70.83 88.42 146.83 128.35 143.94 166.61 74.69 166.42 74.27 88.89 70.83", SA.style "opacity: 0.15; isolation: isolate;" ]
                []
            , Svg.polygon
                [ SA.points "88.89 70.83 89.28 0 52.4 4.48 9.79 74.2 88.89 70.83", SA.style "opacity: 0.15; isolation: isolate;" ]
                []
            , Svg.polygon
                [ SA.points "9.79 74.2 9.57 74.69 48.65 143.94 88.39 146.82 88.42 146.83 88.89 70.83 9.79 74.2", SA.style "opacity: 0.3; isolation: isolate;" ]
                []
            , Svg.polygon
                [ SA.points "40.72 5.95 0 75.34 37.97 143.21 57.72 144.59 18.83 73.83 61.61 3.33 40.72 5.95" ]
                []
            , Svg.polygon
                [ SA.points "136.78 6.47 115.52 3.32 157.08 73.94 119.74 144.69 139.54 143.21 175.67 74 136.78 6.47" ]
                []
            ]
        ]


arrowRight : Svg msg
arrowRight =
    Svg.svg
        [ SA.viewBox "0 0 24 24" ]
        [ Svg.path [ SA.d "M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" ] []
        ]


mapButton msg mapImage btnLabel isSelected =
    button [ class "map-button", onClick msg, selected isSelected ]
        [ mapImage, text btnLabel ]


worldButton lang msg isSelected =
    mapButton msg
        (img [ src <| lang "app.image.world" ] [])
        (lang "app.image.world.label")
        isSelected


countryButton lang msg isSelected =
    mapButton msg
        (img [ src <| lang "app.image.country" ] [])
        (lang "app.image.country.label")
        isSelected
