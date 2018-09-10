defmodule XcoinData.Backend.KrakenRate do
  use Ecto.Schema
  import Ecto.Changeset


  schema "kraken_rates" do
    field :pair, :string
    field :ask, :decimal
    field :bid, :decimal

    timestamps()
  end

  @doc false
  def changeset(kraken_rate, attrs) do
    kraken_rate
    |> cast(attrs, [:pair, :ask, :bid])
    |> validate_required([:pair, :bid])
  end
end
