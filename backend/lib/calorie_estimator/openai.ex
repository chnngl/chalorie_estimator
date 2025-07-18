defmodule CalorieEstimator.OpenAI do
  @moduledoc """
  Module to call OpenAI API for calorie estimation
  """

  @api_key System.get_env("OPENAI_API_KEY")
  @endpoint "https://api.openai.com/v1/chat/completions"

  def estimate_calories(ingredients) do
    prompt = """
    Estimate the calorie breakdown for this meal:
    "#{ingredients}".
    Respond in this JSON format:
    {
      "ingredient": "calories",
      ...
      "total": "total kcal"
    }
    """

    headers = [
      {"Authorization", "Bearer #{@api_key}"},
      {"Content-Type", "application/json"}
    ]

    body = %{
      "model" => "gpt-3.5-turbo",
      "messages" => [%{role: "user", content: prompt}]
    }

    HTTPoison.post(@endpoint, Jason.encode!(body), headers)
    |> handle_response()
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    case Jason.decode(body) do
      {:ok, %{"choices" => [%{"message" => %{"content" => content}}]}} ->
        Jason.decode(content)

      _ -> {:error, "Invalid response format from OpenAI"}
    end
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: code}}), do: {:error, "HTTP #{code}"}
  defp handle_response({:error, error}), do: {:error, inspect(error)}
end
