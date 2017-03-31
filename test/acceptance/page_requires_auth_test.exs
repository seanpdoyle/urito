defmodule Urito.PageRequiresAuthTest do
  use Urito.AcceptanceCase, async: true
  import Urito.Gettext

  test "page requires authentication", %{session: session} do
    visit(session, mapped_url_path(Endpoint, :new))

    assert has_text?(find(session, "body"), gettext("Sign In"))
    assert has_flash?(session, gettext("You must sign in to see this page"))
  end

  defp has_flash?(session, text) do
    session
    |> find("[data-role=error]")
    |> has_text?(text)
  end
end
