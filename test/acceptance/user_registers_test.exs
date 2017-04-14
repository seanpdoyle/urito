defmodule Urito.Feature.UserRegistersTest do
  use Urito.AcceptanceCase, async: true
  import Urito.Gettext

  test "user registers", %{session: session} do
    session
    |> visit(users_path(Endpoint, :new))
    |> fill_in("user_email", with: "user@example.com")
    |> fill_in("user_password", with: "password")
    |> submit_user

    assert has_flash?(session, gettext("Welcome!"))
  end

  defp submit_user(session) do
    session
    |> find("[type=submit]")
    |> click
  end

  defp has_flash?(session, text) do
    session
    |> find("[data-role=info]")
    |> has_text?(text)
  end
end
