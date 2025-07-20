defmodule CalorieEstimatorWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :calorie_estimator

  @session_options [
    store: :cookie,
    key: "_calorie_estimator_key",
    signing_salt: "IznKSx1q",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]


  plug Plug.Static,
    at: "/",
    from: :calorie_estimator,
    gzip: false,
    only: CalorieEstimatorWeb.static_paths()

  if code_reloading? do
    plug Phoenix.CodeReloader
    # plug Phoenix.Ecto.CheckRepoStatus, otp_app: :calorie_estimator
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug CORSPlug, origin: ["http://localhost:5173"]

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug CalorieEstimatorWeb.Router
end
