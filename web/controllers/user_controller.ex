defmodule Urito.UserController do
  use Urito.Web, :controller
  alias Urito.User
  import Urito.Gettext
  import Doorman.Login.Session, only: [login: 2]

  def new(conn, _) do
    changeset = User.registration_changeset(%User{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> login(user)
        |> put_flash(:info, gettext("Welcome!"))
        |> redirect(to: mapped_url_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, gettext("Failed to register."))
        |> render("new.html", changeset: changeset)
      end
  end
end
