defmodule Urito.MappedUrlController do
  use Urito.Web, :controller
  alias Urito.MappedUrl

  def new(conn, _params) do
    changeset = MappedUrl.changeset(%MappedUrl{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"mapped_url" => mapped_url_params}) do
    changeset = MappedUrl.changeset(%MappedUrl{}, mapped_url_params)

    case Repo.insert(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Shortened URL.")
        |> redirect(to: mapped_url_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Failed to shorten URL.")
        |> render("new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    mapped_urls = MappedUrl |> Repo.all

    render(conn, "index.html", mapped_urls: mapped_urls)
  end
end
