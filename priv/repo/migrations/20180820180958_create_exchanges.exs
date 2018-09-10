defmodule XcoinData.Repo.Migrations.CreateExchanges do
  use Ecto.Migration

  def change do
    create table(:exchanges) do
      add :name, :string
      add :location, :string

      timestamps()
    end

  end
end
