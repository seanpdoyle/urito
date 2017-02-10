defmodule Urito.TracksRedirectTest do
  use Urito.AcceptanceCase, async: true

  test "tracks the redirection", %{session: session} do
    mapped_url = insert(:mapped_url)

    session
    |> visit(redirection_path(Endpoint, :show, mapped_url.slug))
    |> visit(mapped_url_path(Endpoint, :index))
    |> click_link("Statistics")

    assert find(session, "[data-role=statistics]") |> has_text?("1")
  end
end
