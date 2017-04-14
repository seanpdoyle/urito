defmodule Urito.SessionController do
  use Urito.Web, :controller
  import Doorman.Login.Session, only: [login: 2, logout: 1]

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    if user = Doorman.authenticate(email, password) do
      conn
      |> login(user)
      |> put_flash(:notice, gettext("Successfully logged in"))
      |> redirect(to: mapped_url_path(conn, :index))
    else
      conn
      |> put_flash(:error, gettext("No user found with the provided credentials"))
      |> redirect(to: session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> logout
    |> redirect(to: session_path(conn, :new))
  end
end
