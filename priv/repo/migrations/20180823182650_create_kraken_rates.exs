defmodule XcoinData.Repo.Migrations.CreateKrakenRates do
  use Ecto.Migration

  def change do
    create table(:kraken_rates) do
      add :pair, :string
      add :ask, :decimal
      add :bid, :decimal

      timestamps()
    end

    create index(:kraken_rates, [:pair])
  end
end
