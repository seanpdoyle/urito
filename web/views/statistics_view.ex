defmodule Urito.StatisticsView do
  use Urito.Web, :view

  def format_month(datetime) do
    datetime
    |> Timex.format!("%B %Y", :strftime)
  end

  def to_chart_data(statistics) do
    statistics
    |> Enum.map(fn s -> [Timex.to_date(s.month), s.requests_count] end)
  end

  def to_json(object) do
    Poison.encode!(object)
  end

  def render("scripts.html", _assigns) do
    ~E(
       <script src="//www.google.com/jsapi"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/chartkick/2.2.3/chartkick.min.js"></script>
     )
  end
end
