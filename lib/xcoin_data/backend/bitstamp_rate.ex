defmodule XcoinData.Backend.BitstampRate do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bitstamp_rates" do
    field :pair, :string
    field :ask, :decimal
    field :bid, :decimal

    timestamps()
  end

  @doc false
  def changeset(bitstamp_rate, attrs) do
    bitstamp_rate
    |> cast(attrs, [:pair, :ask, :bid])
    |> validate_required([:pair, :bid])
  end
end
