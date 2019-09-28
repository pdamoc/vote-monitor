module Data.Context exposing (Context, init)

import I18n exposing (Language)
import I18n.Ro


type alias Context =
    { lang : Language
    , jwt : String
    }


init : Context
init =
    { lang = I18n.Ro.lang
    , jwt = ""
    }
