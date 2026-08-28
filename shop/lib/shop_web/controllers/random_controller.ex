defmodule ShopWeb.RandomController do
  use ShopWeb, :controller

  def random(conn, _params) do
    # html(conn, "<html><body><h1>Test body</h1></body></html>")
    # text(conn, "This is a page")
    # json(conn, %{message: "This is json"})
    render(conn, :random)
  end
end
