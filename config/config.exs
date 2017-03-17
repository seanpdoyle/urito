# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :urito,
  ecto_repos: [Urito.Repo]

# Configures the endpoint
config :urito, Urito.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zlPuooWO5dD+HJ4kvOngtP+/Yak42+Qhe7vQ5VU+XwclyfGszAVkECpbyq70cRZj",
  render_errors: [view: Urito.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Urito.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :doorman,
  repo: Urito.Repo,
  secure_with: Doorman.Auth.Bcrypt,
  user_module: Urito.User

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
