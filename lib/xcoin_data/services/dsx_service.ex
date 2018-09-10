defmodule XcoinData.Services.DsxService do
  @moduledoc """
  DsxService.
  """

  import XcoinData.Services.RequestService

  @base_uri "https://dsx.uk/mapi/"

  # updated 04/09/2017
  @pairs ["btgeur","btcusdt","btcrub","bcceurs","btcgbp","eurseur","ltcbtc","bccusdt","btggbp","eursusd","ethgbp",
          "btgbtc","usdrub","bccbtc","ltcusd","bccusd","btcusd","ltceur","bcceur","btceur","btgusd","ethusd","etheur",
          "ltcgbp","gbpusd","bccgbp","ethbtc","ltcusdt","btceurs","usdtusd","ltceurs","usdteur","etheurs","eurusd","ethusdt"]

  def ticker_rate(pair) do
    url = @base_uri <> "ticker/" <> pair
    response = get_public_request(url)
    if response[pair] do
      bid = response[pair]["buy"]
      ask = response[pair]["sell"]
      IO.puts "ask: " <> "#{ask}" <> " bid: " <> "#{bid}"
      #Backend.create_dsx_rate(%{pair: pair, bid: bid, ask: ask})
    else
      IO.puts "Error"
    end
  end

  def all_rates do
    Enum.each(@pairs, &ticker_rate/1)
  end

end
