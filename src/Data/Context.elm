module Data.Context exposing (Context, init)

import I18n exposing (I18n)
import I18n.Ro


type alias Context =
    { i18n : I18n }


init : Context
init =
    { i18n = I18n.Ro.i18n }
