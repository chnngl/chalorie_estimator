defmodule CalorieEstimator.OpenAI do
  @openai_endpoint "https://api.openai.com/v1/chat/completions"

  def call_api(ingredients) do
    key = System.get_env("OPENAI_API_KEY")
    IO.inspect(key, label: "OPENAI_API_KEY being used")

    body = %{
      model: "gpt-3.5-turbo",
      messages: [
        %{
          role: "system",
          content: "You are a helpful nutritionist that estimates calories for meals."
        },
        %{
          role: "user",
          content: "Estimate calories for: #{ingredients}"
        }
      ]
    }

    headers = [
      {"Authorization", "Bearer #{key}"},
      {"Content-Type", "application/json"}
    ]

    case HTTPoison.post(@openai_endpoint, Jason.encode!(body), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} ->
        {:ok, Jason.decode!(response_body)}

      {:ok, %HTTPoison.Response{status_code: 429}} ->
        {:error, %{"error" => %{"code" => 429}}}

      {:error, reason} ->
        {:error, reason}
    end
  end
end

