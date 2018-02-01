# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :stream2,
  ecto_repos: [Stream2.Repo]

# Configures the endpoint
config :stream2, Stream2.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NIOAPUIlG+cQAMuxVZ0Rgl3CTXWcePGb1VJOuywxJSVNA15Yd9MEzUvuKmjrrcqr",
  render_errors: [view: Stream2.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Stream2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
