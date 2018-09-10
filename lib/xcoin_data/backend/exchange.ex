defmodule XcoinData.Backend.Exchange do
  use Ecto.Schema
  import Ecto.Changeset


  schema "exchanges" do
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(exchange, attrs) do
    exchange
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
