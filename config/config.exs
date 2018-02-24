# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :morkovka,
  ecto_repos: [Morkovka.Repo]

# Configures the endpoint
config :morkovka, MorkovkaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mWrnvqd/2VviPvVIrnQQ9X2dC0cx3/m2x5Vl14b/1JRPiqRRNgO+7gCI+x6I4wh8",
  render_errors: [view: MorkovkaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Morkovka.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine,
    slime: PhoenixSlime.Engine
