# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coffee_speedrun,
  ecto_repos: [CoffeeSpeedrun.Repo]

# Configures the endpoint
config :coffee_speedrun, CoffeeSpeedrunWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/Qw1xWnMnnk7zGzp6El32hixzcHOlrhPhVTNnrBgsPQOgWbobaSKT1tlC+2eyZZc",
  render_errors: [view: CoffeeSpeedrunWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CoffeeSpeedrun.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
