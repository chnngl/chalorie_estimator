defmodule CalorieEstimatorWeb.CalorieController do
  use CalorieEstimatorWeb, :controller

  def estimate(conn, %{"ingredients" => ingredients}) do
    if String.trim(ingredients) == "" do
      conn
      |> put_status(:bad_request)
      |> json(%{error: "Ingredients cannot be empty"})
    else
      case CalorieEstimator.OpenAI.call_api(ingredients) do
        {:ok, result} ->
          content = get_in(result, ["choices", Access.at(0), "message", "content"])
          json(conn, %{calories: content})

        {:error, reason} ->
          IO.inspect(reason, label: "OpenAI error")
          conn
          |> put_status(:internal_server_error)
          |> json(%{error: "OpenAI API failed"})
      end
    end
  end
end




