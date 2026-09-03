defmodule Shop.Vouchers.Voucher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vouchers" do
    field :name, :string
    field :code, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(voucher, attrs) do
    voucher
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code)
  end
end
