defmodule XcoinData.Services.BitstampService do
  @moduledoc """
  BitstampService.
  """

  import XcoinData.Services.RequestService

  @api_version "v2/"
  @base_uri "https://www.bitstamp.net/api/"

  # updated 6/09/2018
  @pairs ["ltcusd","ethusd","xrpeur","bchusd","bcheur","xrpbtc","eurusd","bchbtc",
          "ltceur","btcusd","btceur","ltcbtc","xrpusd","ethbtc","etheur"]


  def ticker_rate(pair) do
    url = @base_uri <> @api_version <> "ticker/" <> pair
    %{"ask" => ask, "bid" => bid } = get_public_request(url)
    case get_public_request(url) do
      %{"ask" => ask, "bid" => bid } ->
        Backend.create_bitstamp_rate(%{pair: pair, bid: bid, ask: ask})
        IO.puts "ask: " <> ask <> " bid: " <> bid
      %{"error" => %{"status" => status}} -> IO.puts "Error status: " <> status
      %{"error" => %{"status" => 500, "reason" => reason}} -> IO.puts "Error: " <> reason
    end
  end

  def all_rates do
    Enum.each(@pairs, &ticker_rate/1)
  end

end
