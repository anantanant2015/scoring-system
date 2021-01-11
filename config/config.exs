# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :scoringsystem,
  ecto_repos: [Scoringsystem.Repo]

# Configures the endpoint
config :scoringsystem, ScoringsystemWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dNR4hWxtvHPSKV8i6flvAn5HaOEMqBRFY6EvAL8XqbW1+yqekWtEfv9AaCVpTHCL",
  render_errors: [view: ScoringsystemWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Scoringsystem.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "psWhurt/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
