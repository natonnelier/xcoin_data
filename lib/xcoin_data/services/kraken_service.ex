defmodule XcoinData.Services.KrakenService do
  @moduledoc """
  KrakenService.
  """

  import XcoinData.Services.RequestService
  alias XcoinData.Backend

  @api_key System.get_env("KRAKEN_API_KEY")
  @api_secret System.get_env("KRAKEN_SECRET_KEY")
  @api_version "0"
  @base_uri "https://api.kraken.com/"

  # updated 04/09/2017
  @pairs ["BCHEUR","BCHUSD","BCHXBT","DASHEUR","DASHUSD","DASHXBT","EOSETH","EOSEUR","EOSUSD","EOSXBT","GNOETH","GNOEUR",
          "GNOUSD","GNOXBT","USDTZUSD","XETCXETH","XETCZEUR","XETCZUSD","XETHZCAD","XETHZEUR",
          "XETHZGBP","XETHZJPY","XETHZUSD","XICNXETH","XICNXXBT","XLTCXXBT","XLTCZEUR","XLTCZUSD",
          "XMLNXETH","XMLNXXBT","XREPXETH","XREPXXBT","XREPZEUR","XREPZUSD","XXBTZCAD","XXBTZEUR","XXBTZGBP",
          "XXBTZJPY","XXBTZUSD","XXDGXXBT","XXLMXXBT","XXLMZEUR","XXLMZUSD","XXMRXXBT","XXMRZEUR",
          "XXMRZUSD","XXRPXXBT","XXRPZCAD","XXRPZEUR","XXRPZJPY","XXRPZUSD","XZECXXBT","XZECZEUR","XZECZJPY","XZECZUSD"]

  def ticker_rate(pair) do
    url = @base_uri <> @api_version <> "/public/" <> "Ticker" <> "?pair=" <> pair
    case get_public_request(url) do
      %{"error" => [], "result" => result } ->
        [ask, aq, av] = result[pair]["a"]
        [bid, bq, bv] = result[pair]["b"]
        IO.puts "ask: #{ask} bid: #{bid}"
        Backend.create_kraken_rate(%{pair: pair, ask: ask, bid: bid})
      %{"error" => error, "result" => %{}} -> IO.puts "Error: " <> error[0]
      %{"error" => %{"status" => 500, "reason" => reason}} -> IO.puts "Error: " <> reason
      %{"error" => %{"status" => 520}} -> IO.puts "Unknown error in Kraken API service"
    end
  end

  def all_rates do
    Enum.each(@pairs, &ticker_rate/1)
  end

end
