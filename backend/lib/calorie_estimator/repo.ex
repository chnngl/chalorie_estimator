defmodule CalorieEstimator.Repo do
  use Ecto.Repo,
    otp_app: :calorie_estimator,
    adapter: Ecto.Adapters.Postgres
end
