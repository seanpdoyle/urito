defmodule Urito.PageController do
  use Urito.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
