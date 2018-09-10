defmodule XcoinData.Repo.Migrations.CreateAcxRates do
  use Ecto.Migration

  def change do
    create table(:acx_rates) do
      add :pair, :string
      add :ask, :decimal
      add :bid, :decimal

      timestamps()
    end

    create index(:acx_rates, [:pair])
  end
end
