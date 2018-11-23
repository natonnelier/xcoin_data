defmodule XcoinDataWeb.Router do
  use XcoinDataWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", XcoinDataWeb do
    pipe_through :browser

    get "/", ChartsController, :index
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", XcoinDataWeb do
    pipe_through :api
  end

end
