defmodule Urito.Feature.UserSignsInTest do
  use Urito.AcceptanceCase, async: true
  import Urito.Gettext

  test "user signs in", %{session: session} do
    user = insert(:user)

    session
    |> visit("/")
    |> fill_in("session_email", with: user.email)
    |> fill_in("session_password", with: to_string user.password)
    |> submit_session

    assert authenticated(session)
    refute unauthenticated(session)
  end

  test "user signs out", %{session: session} do
    user = insert(:user)

    session
    |> visit("/")
    |> fill_in("session_email", with: user.email)
    |> fill_in("session_password", with: to_string user.password)
    |> submit_session
    |> click_on(gettext("Sign Out"))

    refute authenticated(session)
    assert unauthenticated(session)
  end

  defp authenticated(session) do
    visible_page_text(session) =~ "Sign Out"
  end

  defp unauthenticated(session) do
    visible_page_text(session) =~ "Sign In"
  end

  defp submit_session(session) do
    session
    |> find("[type=submit]")
    |> click
  end
end
