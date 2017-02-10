defmodule Urito.RedirectionController do
  use Urito.Web, :controller
  alias Urito.MappedUrl
  alias Urito.Request

  def show(conn, %{"slug" => slug}) do
    mapped_url = MappedUrl.get_by_slug!(slug)

    mapped_url
    |> Request.changeset_for_tracking
    |> Repo.insert!

    redirect(conn, external: mapped_url.source)
  end
end
