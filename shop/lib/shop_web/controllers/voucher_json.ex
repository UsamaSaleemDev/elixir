defmodule ShopWeb.VoucherJSON do
  alias Shop.Vouchers.Voucher

  @doc """
  Renders a list of vouchers.
  """
  def index(%{vouchers: vouchers}) do
    %{data: for(voucher <- vouchers, do: data(voucher))}
  end

  @doc """
  Renders a single voucher.
  """
  def show(%{voucher: voucher}) do
    %{data: data(voucher)}
  end

  defp data(%Voucher{} = voucher) do
    %{
      id: voucher.id,
      name: voucher.name,
      code: voucher.code
    }
  end
end
