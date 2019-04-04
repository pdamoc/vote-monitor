module I18n exposing (I18n)


type alias I18n =
    { name : String
    , donateLink : String
    , pages :
        { home : { text : String, path : String }
        , incidents : { text : String, path : String }
        , statistics : { text : String, path : String }
        , rules : { text : String, path : String }
        , aboutUs : { text : String, path : String }
        , donate : { text : String, path : String }
        }
    }
