defmodule XcoinData.Backend.DsxRate do
  use Ecto.Schema
  import Ecto.Changeset


  schema "dsx_rates" do
    field :pair, :string
    field :ask, :decimal
    field :bid, :decimal

    timestamps()
  end

  @doc false
  def changeset(dsx_rate, attrs) do
    dsx_rate
    |> cast(attrs, [:pair, :ask, :bid])
    |> validate_required([:pair, :bid])
  end
end
