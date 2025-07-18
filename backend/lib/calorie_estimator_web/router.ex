defmodule CalorieEstimatorWeb.Router do
  use CalorieEstimatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CalorieEstimatorWeb do
    pipe_through :api
    post "/estimate", CalorieController, :estimate
  end
end
