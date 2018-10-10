defmodule XcoinData.CronJobs do
    use GenServer

    @exchanges ["acx","bitstamp","dsx","kraken"]

    def start_link do
        GenServer.start_link(__MODULE__, %{})
    end

    def init(state) do
        schedule_work()
        {:ok, state}
    end

    def handle_info(:work, state) do
        Enum.each(@exchanges, &all_rates_from_exchange/1)
        schedule_work()
        {:noreply, state}
    end

    defp all_rates_from_exchange(exchange) do
        task = "monitor." <> exchange <> ".all_rates"
        Mix.Task.run task
    end

    defp schedule_work() do
        Process.send_after(self(), :work, 2 * 60 * 1000) # In 5 min
    end
end
