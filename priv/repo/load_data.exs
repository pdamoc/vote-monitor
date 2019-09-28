# Script for populating the database. You can run it as:
#
#     mix run priv/repo/load_data.exs
#

alias VoteMonitor.{Repo, User, Precinct, City, County}
alias Ecto.Adapters.SQL
import Utils

NimbleCSV.define(CsvParser, separator: "\t", escape: "\"")

Repo.delete_all(Precinct)
Repo.delete_all(City)
Repo.delete_all(County)
 


SQL.query!(
  Repo, "COPY counties (name, code) FROM '#{fullpath(__ENV__, "counties.csv")}' DELIMITERS ',' CSV;"
)