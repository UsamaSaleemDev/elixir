defmodule Shop.Repo.Migrations.CreateVouchers do
  use Ecto.Migration

  def change do
    create table(:vouchers) do
      add :name, :string
      add :code, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:vouchers, [:code])
  end
end
