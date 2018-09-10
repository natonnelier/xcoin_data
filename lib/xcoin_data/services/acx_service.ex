defmodule XcoinData.Services.AcxService do
  @moduledoc """
  AcxService.
  """

  import XcoinData.Services.RequestService

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
        #Backend.create_acx_rate(%{pair: pair, bid: bid, ask: ask})
        IO.puts "AcxRate created"
        IO.puts "buy: #{bid} sell: #{ask}"
      %{"error" => %{"status" => status}} -> IO.puts "Error status: " <> status
      %{"error" => %{"status" => 500, "reason" => reason}} -> IO.puts "Error: " <> reason
    end
  end

  def all_rates do
    Enum.each(@pairs, &ticker_rate/1)
  end

end
