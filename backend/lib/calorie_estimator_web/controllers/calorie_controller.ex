defmodule CalorieEstimatorWeb.CalorieController do
  use CalorieEstimatorWeb, :controller

  alias CalorieEstimator.OpenAI

  def estimate(conn, %{"ingredients" => ingredients}) do
    case OpenAI.estimate_calories(ingredients) do
      {:ok, result} -> json(conn, result)
      {:error, reason} -> conn |> put_status(500) |> json(%{error: reason})
    end
  end
end
