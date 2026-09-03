defmodule Shop.ProductsFixtures do
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some-name",
        console: "pc"
      })
      |> Shop.Products.create_product()

    product
  end
end
