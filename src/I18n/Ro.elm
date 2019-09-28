module I18n.Ro exposing (lang)

import Dict
import I18n exposing (Language)


lang : Language
lang =
    [ ( "app.title", "Monitorizare Vot" )
    , ( "donate.link", "https://code4.ro/doneaza/" )
    , ( "app.image.world", "/images/e65960c5da1d0b48adcedd5a14a78087.png" )
    , ( "app.image.world.label", "În diaspora" )
    , ( "app.image.country", "/images/62381887d308341de9ea72bdfa8eede3.png" )
    , ( "app.image.country.label", "În România" )
    , ( "app.incidentTypes", "[\"Toate\", \"Altul\", \"\"]" )
    , ( "route.home", "" )
    , ( "route.incidents", "sesizari" )
    , ( "route.statistics", "statistici" )
    , ( "route.rules", "reguli-vot" )
    , ( "route.aboutUs", "despre-noi" )
    , ( "route.donate", "doneaza" )
    , ( "nav.home", "Adaugă o sesizare" )
    , ( "nav.incidents", "Sesizări" )
    , ( "nav.statistics", "Statistici" )
    , ( "nav.rules", "Reguli Vot" )
    , ( "nav.aboutUs", "Despre Noi" )
    , ( "nav.donate", "Donează" )
    , ( "pages.home.title", "Sesizează orice incident" )
    , ( "pages.home.first", "Dacă ai sesizat nereguli în timpul campaniei pentru referendum sau în ziua votului postează aici. Ai văzut mesaje care instigă la ură, ai văzut campanii derulate în mod ilegal sau alte comunicări care contravin principiilor democratice și care atacă drepturile fundamentale ale omului? Trimite o sesizare folosind formularul de mai jos. Mesajul tău va fi astfel public și va putea fi văzut de toți utilizatorii și preluat de autorități sau jurnaliști și investigată mai departe." )
    , ( "pages.home.first.button", "Vezi toate sesizările" )
    , ( "pages.incidents.title", "Sesizări" )
    , ( "pages.incidents.first", "România pe care toți ne-o dorim are nevoie de cetățeni responsabili. Iată aici care sunt sesizările raportate de români în țară și în diaspora în ziua referendumului pentru familie din 2018. Află ce se întâmplă în orașul tău de la oameni ca tine, direct de la sursă." )
    , ( "pages.statistics.title", "Statistici" )
    , ( "pages.statistics.first", "Monitorizare Vot îți prezintă ce se întâmplă în secțiile de votare din orașele în care se află observatori independenți, dar și ce spun cetățenii în ziua votului. Aici vei afla care sunt județele fruntașe când vine vorba de nereguli, dar și care sunt cele în care procesul electoral se desfășoară corect și fără incidente." )
    , ( "pages.rules.title", "Cum fac o sesizare?" )
    , ( "pages.rules.first", "Vrei să trimiți o sesizare, dar nu ești sigur dacă s-a încălcat o regulă? Verifică mai jos, în ghidul alegătorului, care sunt regulile de vot la referendum, pentru a transmite informații corecte și utile.\nPentru a ne asigura ca sesizările privesc exact subiectul referendumului pentru familie din 2018, acestea vor fi postate pe site după o verificare făcută de echipa proiectului." )
    , ( "pages.aboutUs.title", "# Află mai multe<br/>despre noi" )
    ]
        |> Dict.fromList
