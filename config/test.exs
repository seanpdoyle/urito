use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :urito, Urito.Endpoint,
  http: [port: 4001],
  server: true

config :urito, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :urito, Urito.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "urito_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
