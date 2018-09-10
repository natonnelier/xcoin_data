defmodule Mix.Tasks.Monitor.Kraken do
  use Mix.Task

  defmodule TickerRate do
    def run(pair) do
      XcoinData.Services.KrakenService.ticker_rate("#{pair}")
    end
  end

  defmodule AllRates do
    def run(_) do
      XcoinData.Services.KrakenService.all_rates
    end
  end
end

defmodule Mix.Tasks.Monitor.Acx do
  use Mix.Task

  defmodule TickerRate do
    def run(pair) do
      XcoinData.Services.AcxService.ticker_rate("#{pair}")
    end
  end

  defmodule AllRates do
    def run(_) do
      XcoinData.Services.AcxService.all_rates
    end
  end

end

defmodule Mix.Tasks.Monitor.Bitstamp do
  use Mix.Task

  defmodule TickerRate do
    def run(pair) do
      XcoinData.Services.BitstampService.ticker_rate("#{pair}")
    end
  end

  defmodule AllRates do
    def run(_) do
      XcoinData.Services.BitstampService.all_rates
    end
  end

end

defmodule Mix.Tasks.Monitor.Dsx do
  use Mix.Task

  defmodule TickerRate do
    def run(pair) do
      XcoinData.Services.DsxService.ticker_rate("#{pair}")
    end
  end

  defmodule AllRates do
    def run(_) do
      XcoinData.Services.DsxService.all_rates
    end
  end
end
