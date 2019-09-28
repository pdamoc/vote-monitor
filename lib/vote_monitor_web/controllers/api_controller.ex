defmodule VoteMonitorWeb.ApiController do
  use VoteMonitorWeb, :controller

  def login(conn, %{"email" => email, "pass" => pass}) do 
    if pass =="letmein" do 
        json(conn, %{jwt: "foo"})
    else 
        json(conn|> put_status(401), %{})
    end
  end 

  def incidentTypes(conn, _params) do
    incidents = 
        [
            # {"id":1,"label":"IT_OTHER","code":"OTH","name":"Altul"},
            # {"id":2,"label":"IT_ELECTION_DAY","code":"ELE","name":"Campanie electoral\u0103 \u00een ziua votului"},
            # {"id":3,"label":"IT_MEDIA","code":"MED","name":"Media & internet"},
            # {"id":4,"label":"IT_BRIBE","code":"MIT","name":"Mit\u0103 electoral\u0103"},
            # {"id":5,"label":"IT_OFFICES","code":"NBE","name":"Nereguli \u00een func\u021bionarea birourilor electorale"},
            # {"id":7,"label":"IT_OBSERVERS","code":"OBP","name":"Probleme legate de observatorii acredita\u021bi"},
            # {"id":8,"label":"IT_ELEC_TURISM","code":"TEL","name":"Turism electoral"},
            # {"id":9,"label":"IT_PUBLIC_FOUNDS","code":"FEL","name":"Utilizarea fondurilor publice \u00een scopuri electorale"},
            # {"id":10,"label":"IT_MULTIPLE","code":"VML","name":"Vot multiplu"},
            # {"id":11,"label":"IT_OPENING","code":"OPN","name":"Deschidere sectie"},
            # {"id":12,"label":"IT_COUNTING","code":"NUM","name":"Numarare"}
        ]
        
    json(conn, %{"data": incidents})
  end
end

