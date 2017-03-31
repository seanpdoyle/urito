defmodule Urito.Plugs.RequireAuth do
  alias Urito.Router.Helpers
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import Urito.Gettext

  def init(opts), do: opts

  def call(conn, _opts) do
    if Doorman.logged_in?(conn) do
      conn
    else
      conn
      |> put_session(:redirect_path, conn.request_path)
      |> put_flash(:error, gettext("You must sign in to see this page"))
      |> redirect(to: Helpers.sessions_path(conn, :new))
      |> halt
    end
  end
end
