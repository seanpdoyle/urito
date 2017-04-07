defmodule Urito.Feature.UserSignsInTest do
  use Urito.AcceptanceCase, async: true

  test "user signs in", %{session: session} do
    user = insert(:user)
    mapped_url = insert(:mapped_url, creator: user)

    session
    |> visit("/")
    |> fill_in("session_email", with: user.email)
    |> fill_in("session_password", with: to_string user.password)
    |> submit_session

    assert has_mapped_url?(session, mapped_url)
  end

  defp submit_session(session) do
    session
    |> find("[type=submit]")
    |> click
  end

  defp has_mapped_url?(session, mapped_url) do
    mappings = find(session, "[data-role=mapped-urls]")

    mappings |> has_text?(mapped_url.source) &&
    mappings |> has_text?(mapped_url.slug)
  end
end
