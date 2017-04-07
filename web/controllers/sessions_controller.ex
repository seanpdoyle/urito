defmodule Urito.SessionsController do
  use Urito.Web, :controller
  import Doorman.Login.Session, only: [login: 2]

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
      |> redirect(to: sessions_path(conn, :new))
    end
  end
end
