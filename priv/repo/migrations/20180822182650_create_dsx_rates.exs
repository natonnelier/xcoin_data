defmodule XcoinData.Repo.Migrations.CreateDsxRates do
  use Ecto.Migration

  def change do
    create table(:dsx_rates) do
      add :pair, :string
      add :ask, :decimal
      add :bid, :decimal

      timestamps()
    end

    create index(:dsx_rates, [:pair])
  end
end
