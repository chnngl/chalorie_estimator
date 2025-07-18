defmodule CalorieEstimator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CalorieEstimatorWeb.Telemetry,
      # CalorieEstimator.Repo,
      {DNSCluster, query: Application.get_env(:calorie_estimator, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CalorieEstimator.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CalorieEstimator.Finch},
      # Start a worker by calling: CalorieEstimator.Worker.start_link(arg)
      # {CalorieEstimator.Worker, arg},
      # Start to serve requests, typically the last entry
      CalorieEstimatorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CalorieEstimator.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CalorieEstimatorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
