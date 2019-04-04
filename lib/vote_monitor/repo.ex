defmodule VoteMonitor.Repo do
  use Ecto.Repo,
    otp_app: :vote_monitor,
    adapter: Ecto.Adapters.Postgres
end
