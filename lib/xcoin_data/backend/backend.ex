defmodule XcoinData.Backend do
  @moduledoc """
  The Backend context.
  """

  import Ecto.Query, warn: false
  alias XcoinData.Repo

  alias XcoinData.Backend.Exchange

  @doc """
  Returns the list of exchanges.

  ## Examples

      iex> list_exchanges()
      [%Exchange{}, ...]

  """
  def list_exchanges do
    Repo.all(Exchange)
  end

  @doc """
  Gets a single exchange.

  Raises `Ecto.NoResultsError` if the Exchange does not exist.

  ## Examples

      iex> get_exchange!(123)
      %Exchange{}

      iex> get_exchange!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exchange!(id), do: Repo.get!(Exchange, id)

  @doc """
  Creates a exchange.

  ## Examples

      iex> create_exchange(%{field: value})
      {:ok, %Exchange{}}

      iex> create_exchange(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exchange(attrs \\ %{}) do
    %Exchange{}
    |> Exchange.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exchange.

  ## Examples

      iex> update_exchange(exchange, %{field: new_value})
      {:ok, %Exchange{}}

      iex> update_exchange(exchange, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exchange(%Exchange{} = exchange, attrs) do
    exchange
    |> Exchange.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Exchange.

  ## Examples

      iex> delete_exchange(exchange)
      {:ok, %Exchange{}}

      iex> delete_exchange(exchange)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exchange(%Exchange{} = exchange) do
    Repo.delete(exchange)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exchange changes.

  ## Examples

      iex> change_exchange(exchange)
      %Ecto.Changeset{source: %Exchange{}}

  """
  def change_exchange(%Exchange{} = exchange) do
    Exchange.changeset(exchange, %{})
  end

  alias XcoinData.Backend.Rate

  @doc """
  Returns the list of rates.

  ## Examples

      iex> list_rates()
      [%Rate{}, ...]

  """
  def list_rates do
    Repo.all(Rate)
  end

  @doc """
  Gets a single rate.

  Raises `Ecto.NoResultsError` if the Rate does not exist.

  ## Examples

      iex> get_rate!(123)
      %Rate{}

      iex> get_rate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rate!(id), do: Repo.get!(Rate, id)

  @doc """
  Creates a rate.

  ## Examples

      iex> create_rate(%{field: value})
      {:ok, %Rate{}}

      iex> create_rate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rate(attrs \\ %{}) do
    %Rate{}
    |> Rate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rate.

  ## Examples

      iex> update_rate(rate, %{field: new_value})
      {:ok, %Rate{}}

      iex> update_rate(rate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rate(%Rate{} = rate, attrs) do
    rate
    |> Rate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rate.

  ## Examples

      iex> delete_rate(rate)
      {:ok, %Rate{}}

      iex> delete_rate(rate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rate(%Rate{} = rate) do
    Repo.delete(rate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rate changes.

  ## Examples

      iex> change_rate(rate)
      %Ecto.Changeset{source: %Rate{}}

  """
  def change_rate(%Rate{} = rate) do
    Rate.changeset(rate, %{})
  end

  @doc """
  Create acx_rate
  """

  def create_acx_rate(attrs \\ %{}) do
    %XcoinData.Backend.AcxRate{}
    |> AcxRate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create bitstamp_rate
  """

  def create_bitstamp_rate(attrs \\ %{}) do
    %XcoinData.Backend.BitstampRate{}
    |> BitstampRate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create dsx_rate
  """

  def create_dsx_rate(attrs \\ %{}) do
    %XcoinData.Backend.DsxRate{}
    |> DsxRate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create kraken_rate
  """

  def create_kraken_rate(%{pair: pair, bid: bid, ask: ask}) do
    IO.puts normalize(pair)
    #%XcoinData.Backend.KrakenRate{}
    #|> KrakenRate.changeset(attrs)
    #|> Repo.insert()
  end

  defp normalize(xcoin) do
    case xcoin do
      n when n in ["BCHXBT"] -> "bchbtc"
      n when n in ["DASHXBT"] -> "dashbtc"
      n when n in ["EOSXBT"] -> "eosbtc"
      n when n in ["XETCXETH"] -> "etceth"
      n when n in ["XETCZEUR"] -> "etceur"
      n when n in ["XETCZUSD"] -> "etcusd"
      n when n in ["XETHZCAD"] -> "ethcad"
      n when n in ["XETHZEUR"] -> "etheur"
      n when n in ["XETHZGBP"] -> "ethgbp"
      n when n in ["XETHZJPY"] -> "ethjpy"
      n when n in ["XETHZUSD"] -> "ethusd"
      n when n in ["XICNXETH"] -> "icneth"
      n when n in ["XICNXXBT"] -> "icnbtc"
      n when n in ["XLTCXXBT"] -> "ltcbtc"
      n when n in ["XLTCZEUR"] -> "ltceur"
      n when n in ["XLTCZUSD"] -> "ltcusd"
      n when n in ["XMLNXETH"] -> "mlneth"
      n when n in ["XMLNXXBT"] -> "mlnbtc"
      n when n in ["XREPXETH"] -> "repeth"
      n when n in ["XREPXXBT"] -> "repbtc"
      n when n in ["XREPZEUR"] -> "repeur"
      n when n in ["XREPZUSD"] -> "repusd"
      n when n in ["XXBTZCAD"] -> "btccad"
      n when n in ["XXBTZEUR"] -> "btceur"
      n when n in ["XXBTZGBP"] -> "btcgbp"
      n when n in ["XXBTZJPY"] -> "btcjpy"
      n when n in ["XXBTZUSD"] -> "btcusd"
      n when n in ["XXDGXXBT"] -> "xdgbtc"
      n when n in ["XXLMXXBT"] -> "xlmbtc"
      n when n in ["XXLMZEUR"] -> "xlmeur"
      n when n in ["XXLMZUSD"] -> "xlmusd"
      n when n in ["XXMRXXBT"] -> "xmrbtc"
      n when n in ["XXMRZEUR"] -> "xmreur"
      n when n in ["XXMRZUSD"] -> "xmrusd"
      n when n in ["XXRPXXBT"] -> "xmrbtc"
      n when n in ["XXRPZCAD"] -> "xrpcad"
      n when n in ["XXRPZEUR"] -> "xrpeur"
      n when n in ["XXRPZJPY"] -> "xrpjpy"
      n when n in ["XXRPZUSD"] -> "xrpusd"
      n when n in ["XZECXXBT"] -> "zecbtc"
      n when n in ["XZECZEUR"] -> "zeceur"
      n when n in ["XZECZJPY"] -> "zecjpy"
      n when n in ["XZECZUSD"] -> "zecusd"
      _ -> String.downcase(xcoin)
    end

  end
end
