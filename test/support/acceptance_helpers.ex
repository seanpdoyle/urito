defmodule Urito.FeatureHelpers do
  use Wallaby.DSL

  def visible_page_text(page) do
    page
    |> find("body")
    |> text
  end
end
