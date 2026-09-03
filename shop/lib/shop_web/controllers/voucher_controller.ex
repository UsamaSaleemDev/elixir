defmodule ShopWeb.VoucherController do
  use ShopWeb, :controller

  alias Shop.Vouchers
  alias Shop.Vouchers.Voucher

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    vouchers = Vouchers.list_vouchers()
    render(conn, :index, vouchers: vouchers)
  end

  def create(conn, %{"voucher" => voucher_params}) do
    with {:ok, %Voucher{} = voucher} <- Vouchers.create_voucher(voucher_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/vouchers/#{voucher}")
      |> render(:show, voucher: voucher)
    end
  end

  def show(conn, %{"id" => id}) do
    voucher = Vouchers.get_voucher!(id)
    render(conn, :show, voucher: voucher)
  end

  def update(conn, %{"id" => id, "voucher" => voucher_params}) do
    voucher = Vouchers.get_voucher!(id)

    with {:ok, %Voucher{} = voucher} <- Vouchers.update_voucher(voucher, voucher_params) do
      render(conn, :show, voucher: voucher)
    end
  end

  def delete(conn, %{"id" => id}) do
    voucher = Vouchers.get_voucher!(id)

    with {:ok, %Voucher{}} <- Vouchers.delete_voucher(voucher) do
      send_resp(conn, :no_content, "")
    end
  end
end
