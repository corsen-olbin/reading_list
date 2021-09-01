# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :reading_list,
  ecto_repos: [ReadingList.Repo]

# Configures the endpoint
config :reading_list, ReadingListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rspFRCPkMSuj60psi0+wRCbZ9iZAca9LawUv+zIYH99TXOfA9Uds2Rth0ahyCt/h",
  render_errors: [view: ReadingListWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ReadingList.PubSub,
  live_view: [signing_salt: "RnjCQyvV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :reading_list, ReadingList.Accounts.Guardian,
  issuer: "reading_list",
  secret_key: "ZE9ZPBzJJlCvOJ/etWvWsF488a6DNEQfpcAvKSeCesRt/WokVhgXgnhXRBAl5gwL"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
