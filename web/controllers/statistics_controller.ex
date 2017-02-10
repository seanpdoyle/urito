defmodule Urito.StatisticsController do
  use Urito.Web, :controller
  alias Urito.MappedUrl
  alias Urito.Statistics

  def index(conn, %{"mapped_url_id" => mapped_url_id}) do
    statistics = MappedUrl
                 |> Repo.get!(mapped_url_id)
                 |> Repo.preload(:requests)
                 |> Statistics.build

    render conn, "index.html", statistics: statistics
  end
end
