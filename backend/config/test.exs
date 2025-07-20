import Config

config :calorie_estimator, CalorieEstimatorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "GOfAwL4RAovI7EEeQbrJ/+CKBIwo7OplfE/YGKf6TdBabsrSTw83l7HX2Zhyyl5H",
  server: false

config :calorie_estimator, CalorieEstimator.Mailer, adapter: Swoosh.Adapters.Test

config :swoosh, :api_client, false

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime
