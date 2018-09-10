defmodule XcoinData.Backend.Rate do
  use Ecto.Schema
  import Ecto.Changeset


  schema "rates" do
    field :pair, :string
    field :price, :decimal
    belongs_to :backend_exchange, Exchange

    timestamps()
  end

  @doc false
  def changeset(rate, attrs) do
    rate
    |> cast(attrs, [:pair, :price])
    |> validate_required([:pair, :price])
  end
end
