defmodule Urito.StatisticsView do
  use Urito.Web, :view
  use Timex

  def format_month(datetime) do
    datetime
    |> Timex.format!("%B %Y", :strftime)
  end
end
