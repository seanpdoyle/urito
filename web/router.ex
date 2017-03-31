defmodule Urito.Router do
  use Urito.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Doorman.Login.Session
  end

  pipeline :require_auth do
    plug Urito.Plugs.RequireAuth
  end

  scope "/", Urito do
    pipe_through [:browser, :require_auth]

    resources "/urls", MappedUrlController, only: [:new, :create, :index] do
      resources "/statistics", StatisticsController, only: [:index]
    end
    get "/", MappedUrlController, :index
  end

  scope "/", Urito do
    pipe_through :browser

    resources "/sessions", SessionsController, only: [:new, :create]

    get "/:slug", RedirectionController, :show
  end
end
