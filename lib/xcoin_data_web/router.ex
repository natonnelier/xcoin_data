defmodule XcoinDataWeb.Router do
  use XcoinDataWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", XcoinDataWeb do
    pipe_through :api
  end
end
