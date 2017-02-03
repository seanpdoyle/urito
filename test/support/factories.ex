defmodule Urito.Factory do
  use ExMachina.Ecto, repo: Urito.Repo

  def mapped_url_factory do
    %Urito.MappedUrl{
      source: "https://example.com",
      slug: sequence(:slug, &"slug-#{&1}")
    }
  end
end
