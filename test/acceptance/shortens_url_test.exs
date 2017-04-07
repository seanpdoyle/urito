defmodule Urito.ShortensUrlTest do
  use Urito.AcceptanceCase, async: true

  test "shortens a URL", %{session: session} do
    user = insert(:user)
    session
    |> visit(mapped_url_path(Endpoint, :new, as: user))
    |> fill_in("mapped_url_source", with: "https://example.com")
    |> fill_in("mapped_url_slug", with: "ex")
    |> submit_mapped_url

    assert has_mapped_url?(session, source: "https://example.com", slug: "ex")
  end

  test "displays validation errors", %{session: session} do
    session
    |> visit(mapped_url_path(Endpoint, :new))
    |> fill_in("mapped_url_slug", with: "invalid!")
    |> submit_mapped_url

    assert has_errors?(session, "can't be blank")
  end

  defp has_errors?(session, text) do
    session
    |> find("form")
    |> has_text?(text)
  end

  defp has_mapped_url?(session, source: source, slug: slug) do
    mappings = find(session, "[data-role=mapped-urls]")

    mappings |> has_text?(source) &&
    mappings |> has_text?(slug)
  end

  defp submit_mapped_url(session) do
    session
    |> find("[type=submit]")
    |> click
  end
end
