# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :xcoin_data,
  ecto_repos: [XcoinData.Repo]

# Configures the endpoint
config :xcoin_data, XcoinDataWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uZiogBGll8BzzdVX7mFoooSF/dMwE/4X7t9ZFBYNqZgQ/0Phg+IyihkhoA5vZ4Hz",
  render_errors: [view: XcoinDataWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: XcoinData.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Cron jobs Quantum
config :xcoin_data, XcoinData.Scheduler,
    jobs: [
        {"*/5 * * * *",   fn -> Mix.Task.rerun "monitor.acx.all_rates" end},
        {"*/5 * * * *",   fn -> Mix.Task.rerun "monitor.bitstamp.all_rates" end},
        {"*/5 * * * *",   fn -> Mix.Task.rerun "monitor.dsx.all_rates" end},
        {"*/5 * * * *",   fn -> Mix.Task.rerun "monitor.kraken.all_rates" end}
    ]
