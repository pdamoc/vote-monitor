module Api exposing (login)

import Http exposing (Error)
import Json.Decode as Json


login : String -> String -> (Result Error String -> msg) -> Cmd msg
login email pass toMsg =
    Http.post
        { url = "https://example.com/books"
        , body = Http.emptyBody
        , expect = Http.expectJson toMsg (Json.field "jwt" Json.string)
        }
