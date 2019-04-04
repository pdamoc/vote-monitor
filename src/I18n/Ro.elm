module I18n.Ro exposing (i18n)

import I18n exposing (I18n)


i18n : I18n
i18n =
    { name = "Monitorizare Vot"
    , donateLink = "https://code4.ro/doneaza/"
    , pages =
        { home =
            { text = "Adaugă o sesizare"
            , path = ""
            }
        , incidents =
            { text = "Sesizări"
            , path = "sesizari"
            }
        , statistics =
            { text = "Statistici"
            , path = "statistici"
            }
        , rules =
            { text = "Reguli Vot"
            , path = "reguli-vot"
            }
        , aboutUs =
            { text = "Despre Noi"
            , path = "despre-noi"
            }
        , donate =
            { text = "Donează"
            , path = "doneaza"
            }
        }
    }
