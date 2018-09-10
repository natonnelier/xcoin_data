defmodule XcoinData.Repo.Migrations.CreateBitstampRates do
  use Ecto.Migration

  def change do
    create table(:bitstamp_rates) do
      add :pair, :string
      add :ask, :decimal
      add :bid, :decimal

      timestamps()
    end

    create index(:bitstamp_rates, [:pair])
  end
end
