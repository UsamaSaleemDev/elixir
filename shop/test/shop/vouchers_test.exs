defmodule Shop.VouchersTest do
  use Shop.DataCase

  alias Shop.Vouchers

  describe "vouchers" do
    alias Shop.Vouchers.Voucher

    import Shop.VouchersFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_vouchers/0 returns all vouchers" do
      voucher = voucher_fixture()
      assert Vouchers.list_vouchers() == [voucher]
    end

    test "get_voucher!/1 returns the voucher with given id" do
      voucher = voucher_fixture()
      assert Vouchers.get_voucher!(voucher.id) == voucher
    end

    test "create_voucher/1 with valid data creates a voucher" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %Voucher{} = voucher} = Vouchers.create_voucher(valid_attrs)
      assert voucher.code == "some code"
      assert voucher.name == "some name"
    end

    test "create_voucher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vouchers.create_voucher(@invalid_attrs)
    end

    test "update_voucher/2 with valid data updates the voucher" do
      voucher = voucher_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %Voucher{} = voucher} = Vouchers.update_voucher(voucher, update_attrs)
      assert voucher.code == "some updated code"
      assert voucher.name == "some updated name"
    end

    test "update_voucher/2 with invalid data returns error changeset" do
      voucher = voucher_fixture()
      assert {:error, %Ecto.Changeset{}} = Vouchers.update_voucher(voucher, @invalid_attrs)
      assert voucher == Vouchers.get_voucher!(voucher.id)
    end

    test "delete_voucher/1 deletes the voucher" do
      voucher = voucher_fixture()
      assert {:ok, %Voucher{}} = Vouchers.delete_voucher(voucher)
      assert_raise Ecto.NoResultsError, fn -> Vouchers.get_voucher!(voucher.id) end
    end

    test "change_voucher/1 returns a voucher changeset" do
      voucher = voucher_fixture()
      assert %Ecto.Changeset{} = Vouchers.change_voucher(voucher)
    end
  end
end
