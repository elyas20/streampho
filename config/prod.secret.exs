use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :stream2, Stream2.Endpoint,
  secret_key_base: "LRH+ZNk4zRONTlJTuAXoa5jy38QvF+M5n0IYpnlQjqQyDZ1vo1OClvD9BQ91Hz12"

# Configure your database
config :stream2, Stream2.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "stream2_prod",
  pool_size: 15
