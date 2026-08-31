defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  @products [
    %{id: "1", name: "ABC"},
    %{id: "2", name: 123},
    %{id: "3", name: XYZ}
  ]

  def index(conn, _params) do
    conn
    |> assign(:products, @products)
    |> render(:index)
  end

  def show(conn, %{"id" => id}) do
    product = Enum.find(@products, fn product -> product.id == id end)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
