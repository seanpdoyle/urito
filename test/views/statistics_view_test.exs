defmodule Urito.StatisticsViewTest do
  use Urito.ConnCase, async: true

  import DateTime
  import GoodTimes

  alias Urito.StatisticsView

  test "graph_data_for transforms Statistics into lists of lists" do
    last_year = a_year_ago() |> cast!
    today = now() |> cast!
    next_year = a_year_from_now() |> cast!
    statistics = [
      %{month: last_year, requests_count: 5},
      %{month: today, requests_count: 3},
      %{month: next_year, requests_count: 1},
    ]

    graph_data = StatisticsView.to_chart_data(statistics)

    assert graph_data == [
      [to_date(last_year), 5],
      [to_date(today), 3],
      [to_date(next_year), 1],
    ]
  end
end
