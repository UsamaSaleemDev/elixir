defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html
  alias Shop.Products.Product

  embed_templates "product_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <.link href={~p"/products/#{@product.slug}"} class="block">
      <p>ID: <%= @product.id %></p>
      <p>Game: <%= @product.name %></p>
      <p>Console: <%= @product.console %></p>
    </.link>
    """
  end
end
