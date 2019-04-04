# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vote_monitor,
  ecto_repos: [VoteMonitor.Repo]

# Configures the endpoint
config :vote_monitor, VoteMonitorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gC9Qr9qPB6JpnYCoqITClKrSo62lXboWTQTISyO+ToXP6QwcwFS4Jm/jvaN1m2cw",
  render_errors: [view: VoteMonitorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VoteMonitor.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
