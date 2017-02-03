defmodule Urito.RedirectionControllerTest do
  use Urito.ConnCase, async: true

  test "#show redirects to the source URL", %{conn: conn} do
    mapped_url = insert(:mapped_url)

    conn = get conn, redirection_path(conn, :show, mapped_url.slug)

    assert redirected_to(conn, 302) == mapped_url.source
  end
end
