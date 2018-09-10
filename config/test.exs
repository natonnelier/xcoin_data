use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :xcoin_data, XcoinDataWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :xcoin_data, XcoinData.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "xcoin_data_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
