defmodule Urito.RequestTest do
  use Urito.ModelCase

  alias Urito.Statistics

  test ".build/1" do
    mapped_url = insert(:mapped_url)
    insert(:request, mapped_url: mapped_url)

    statistics = mapped_url
                 |> Repo.preload(:requests)
                 |> Statistics.build

    assert %Statistics{
      slug: mapped_url.slug,
      views: 1,
    } == statistics
  end
end
