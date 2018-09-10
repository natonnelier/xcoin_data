defmodule XcoinData.Backend.AcxRate do
  use Ecto.Schema
  import Ecto.Changeset
  alias AcxRate


  schema "acx_rates" do
    field :pair, :string
    field :ask, :decimal
    field :bid, :decimal

    timestamps()
  end

  @doc false
  def changeset(acx_rate, attrs) do
    acx_rate
    |> cast(attrs, [:pair, :ask, :bid])
    |> validate_required([:pair, :bid])
  end
end
