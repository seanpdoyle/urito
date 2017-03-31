defmodule Urito.SessionsController do
  use Urito.Web, :controller

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"session" => session_params}) do
  end
end
