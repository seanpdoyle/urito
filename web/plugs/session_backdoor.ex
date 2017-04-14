defmodule Urito.Plugs.SessionBackdoor do
  alias Urito.Repo
  alias Urito.User
  import Doorman.Login.Session, only: [login: 2]

  def init(opts), do: opts

  def call(conn, _opts) do
    case conn.query_params do
      %{"as" => id} ->
        user = Repo.get!(User, id)

        login(conn, user)
      _ -> conn
    end
  end
end
