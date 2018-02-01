defmodule Stream2.PageController do
  use Stream2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
