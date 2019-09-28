module Data.Context exposing (Context, init)

import I18n exposing (Language)
import I18n.Ro


type alias Context =
    { lang : Language
    , jwt : Maybe String
    }


validateJwt : String -> Maybe String
validateJwt jwt =
    -- TODO: implement jwt validation
    Just jwt


init : String -> Context
init jwt =
    { lang = I18n.Ro.lang
    , jwt = validateJwt jwt
    }
