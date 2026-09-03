defmodule ShopWeb.VoucherControllerTest do
  use ShopWeb.ConnCase

  import Shop.VouchersFixtures
  alias Shop.Vouchers.Voucher

  @create_attrs %{
    code: "some code",
    name: "some name"
  }
  @update_attrs %{
    code: "some updated code",
    name: "some updated name"
  }
  @invalid_attrs %{code: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vouchers", %{conn: conn} do
      conn = get(conn, ~p"/api/vouchers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create voucher" do
    test "renders voucher when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/vouchers", voucher: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/vouchers/#{id}")

      assert %{
               "id" => ^id,
               "code" => "some code",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/vouchers", voucher: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update voucher" do
    setup [:create_voucher]

    test "renders voucher when data is valid", %{conn: conn, voucher: %Voucher{id: id} = voucher} do
      conn = put(conn, ~p"/api/vouchers/#{voucher}", voucher: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/vouchers/#{id}")

      assert %{
               "id" => ^id,
               "code" => "some updated code",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, voucher: voucher} do
      conn = put(conn, ~p"/api/vouchers/#{voucher}", voucher: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete voucher" do
    setup [:create_voucher]

    test "deletes chosen voucher", %{conn: conn, voucher: voucher} do
      conn = delete(conn, ~p"/api/vouchers/#{voucher}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/vouchers/#{voucher}")
      end
    end
  end

  defp create_voucher(_) do
    voucher = voucher_fixture()

    %{voucher: voucher}
  end
end
