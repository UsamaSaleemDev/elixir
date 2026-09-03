defmodule ShopWeb.PageControllerTest do
  use ShopWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "This is the best video game e-com store."
  end
end
