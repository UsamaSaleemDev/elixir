defmodule Shop.VouchersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Vouchers` context.
  """

  @doc """
  Generate a unique voucher code.
  """
  def unique_voucher_code, do: "some code#{System.unique_integer([:positive])}"

  @doc """
  Generate a voucher.
  """
  def voucher_fixture(attrs \\ %{}) do
    {:ok, voucher} =
      attrs
      |> Enum.into(%{
        code: unique_voucher_code(),
        name: "some name"
      })
      |> Shop.Vouchers.create_voucher()

    voucher
  end
end
