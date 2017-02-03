defmodule Urito.RedirectionController do
  use Urito.Web, :controller
  alias Urito.MappedUrl

  def show(conn, %{"slug" => slug}) do
    mapped_url = Repo.get_by!(MappedUrl, slug: slug)

    redirect(conn, external: mapped_url.source)
  end
end
