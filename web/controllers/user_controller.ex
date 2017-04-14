defmodule Urito.UserController do
  use Urito.Web, :controller

  def create(conn, %{}) do
    conn
    |> redirect(to: mapped_url_path(conn, :index))
  end

  def new(conn, _) do
    render conn, "new.html"
  end
end
