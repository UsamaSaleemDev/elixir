defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  # @products [
  #   %{id: "1", name: "ABC"},
  #   %{id: "2", name: 123},
  #   %{id: "3", name: XYZ}
  # ]

  alias Shop.Products

  def index(conn, _params) do
    products = Products.list_products()

    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def show(conn, %{"slug" => slug}) do
    product = Products.find_product_by_slug(slug)
    # product = Enum.find(@products, fn product -> product.id == id end)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
