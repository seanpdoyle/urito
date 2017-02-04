defmodule Urito.MappedUrlTest do
  use Urito.ModelCase
  alias Urito.MappedUrl

  test "validations" do
    invalid_attributes = %{source: nil, slug: nil}

    assert [
      {:slug, "can't be blank"},
      {:source, "can't be blank"},
    ] == errors_on(%MappedUrl{}, invalid_attributes)
  end

  test "validates uniqueness of slug" do
    existing_mapped_url = insert(:mapped_url)
    mapped_url = changeset_for(slug: existing_mapped_url.slug)

    {:error, changeset } = Repo.insert(mapped_url)

    assert {:slug, { "has already been taken", []}} in changeset.errors
  end

  defp changeset_for(attributes) do
    params = params_for(:mapped_url, attributes)

    MappedUrl.changeset(%MappedUrl{}, params)
  end
end
