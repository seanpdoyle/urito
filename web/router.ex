defmodule Urito.Router do
  use Urito.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Urito do
    pipe_through :browser

    resources "/urls", MappedUrlController, only: [:new, :create, :index] do
      resources "/statistics", StatisticsController, only: [:index]
    end
    get "/", MappedUrlController, :index
    get "/:slug", RedirectionController, :show
  end
end
