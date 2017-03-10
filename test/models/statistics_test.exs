defmodule Urito.StatisticsTest do
  use Urito.ModelCase

  import GoodTimes
  alias Urito.Statistics

  test "relies on a SQL view" do
    mapped_url = insert(:mapped_url)
    insert(:request, mapped_url: mapped_url, inserted_at: a_year_ago())
    insert(:request, mapped_url: mapped_url, inserted_at: a_month_ago())
    insert(:request, mapped_url: mapped_url, inserted_at: now())

    statistics = Statistics
                 |> where(mapped_url_id: ^mapped_url.id)
                 |> Repo.all

    counts = statistics
             |> Enum.map(fn(s) -> s.requests_count end)
             |> Enum.sum

    assert counts == 3
  end
end
