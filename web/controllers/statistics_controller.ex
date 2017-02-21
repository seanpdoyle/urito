defmodule Urito.StatisticsController do
  use Urito.Web, :controller
  alias Urito.MappedUrl

  def index(conn, %{"mapped_url_id" => mapped_url_id}) do
    mapped_url = MappedUrl
                 |> Repo.get!(mapped_url_id)
                 |> Repo.preload(:statistics)

    render conn, "index.html", mapped_url: mapped_url
  end
end
