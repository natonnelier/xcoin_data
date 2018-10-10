defmodule XcoinData.Services.AcxService do
  @moduledoc """
  AcxService.
  """

  import XcoinData.Services.RequestService

  alias XcoinData.Backend

  @api_key System.get_env("ACX_API_KEY")
  @api_secret System.get_env("ACX_SECRET_KEY")
  @api_version "v2/"
  @base_uri "https://acx.io/api/"

  # updated 04/09/2017
  @pairs ["btcaud","ethaud","bchaud","ltcaud","hsraud","usdtaud","btcusdt","ethusdt","dashbtc","fuelbtc","ubtcbtc"]

  def ticker_rate(pair) do
    url = @base_uri <> @api_version <> "tickers/" <> pair <> ".json"
    case get_public_request(url) do
      %{"ticker" => %{"buy" => bid, "sell" => ask}} ->
        Backend.create_acx_rate(%{pair: pair, ask: String.to_float(ask), bid: String.to_float(bid)})
      %{"error" => %{"status" => 404}} -> IO.puts "404 Not found"
      %{"error" => %{"status" => 500, "reason" => reason}} -> IO.puts "Error: " <> reason
      %{"error" => %{"status" => 520}} -> IO.puts "Unknown error in ACX api service"
    end
  end

  def all_rates do
    Enum.each(@pairs, &ticker_rate/1)
  end

end
