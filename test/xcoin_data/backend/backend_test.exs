defmodule XcoinData.BackendTest do
  use XcoinData.DataCase

  alias XcoinData.Backend

  describe "exchanges" do
    alias XcoinData.Backend.Exchange

    @valid_attrs %{location: "some location", name: "some name"}
    @update_attrs %{location: "some updated location", name: "some updated name"}
    @invalid_attrs %{location: nil, name: nil}

    def exchange_fixture(attrs \\ %{}) do
      {:ok, exchange} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Backend.create_exchange()

      exchange
    end

    test "list_exchanges/0 returns all exchanges" do
      exchange = exchange_fixture()
      assert Backend.list_exchanges() == [exchange]
    end

    test "get_exchange!/1 returns the exchange with given id" do
      exchange = exchange_fixture()
      assert Backend.get_exchange!(exchange.id) == exchange
    end

    test "create_exchange/1 with valid data creates a exchange" do
      assert {:ok, %Exchange{} = exchange} = Backend.create_exchange(@valid_attrs)
      assert exchange.location == "some location"
      assert exchange.name == "some name"
    end

    test "create_exchange/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Backend.create_exchange(@invalid_attrs)
    end

    test "update_exchange/2 with valid data updates the exchange" do
      exchange = exchange_fixture()
      assert {:ok, exchange} = Backend.update_exchange(exchange, @update_attrs)
      assert %Exchange{} = exchange
      assert exchange.location == "some updated location"
      assert exchange.name == "some updated name"
    end

    test "update_exchange/2 with invalid data returns error changeset" do
      exchange = exchange_fixture()
      assert {:error, %Ecto.Changeset{}} = Backend.update_exchange(exchange, @invalid_attrs)
      assert exchange == Backend.get_exchange!(exchange.id)
    end

    test "delete_exchange/1 deletes the exchange" do
      exchange = exchange_fixture()
      assert {:ok, %Exchange{}} = Backend.delete_exchange(exchange)
      assert_raise Ecto.NoResultsError, fn -> Backend.get_exchange!(exchange.id) end
    end

    test "change_exchange/1 returns a exchange changeset" do
      exchange = exchange_fixture()
      assert %Ecto.Changeset{} = Backend.change_exchange(exchange)
    end
  end

  describe "rates" do
    alias XcoinData.Backend.Rate

    @valid_attrs %{pair: "some pair", price: "120.5"}
    @update_attrs %{pair: "some updated pair", price: "456.7"}
    @invalid_attrs %{pair: nil, price: nil}

    def rate_fixture(attrs \\ %{}) do
      {:ok, rate} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Backend.create_rate()

      rate
    end

    test "list_rates/0 returns all rates" do
      rate = rate_fixture()
      assert Backend.list_rates() == [rate]
    end

    test "get_rate!/1 returns the rate with given id" do
      rate = rate_fixture()
      assert Backend.get_rate!(rate.id) == rate
    end

    test "create_rate/1 with valid data creates a rate" do
      assert {:ok, %Rate{} = rate} = Backend.create_rate(@valid_attrs)
      assert rate.pair == "some pair"
      assert rate.price == Decimal.new("120.5")
    end

    test "create_rate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Backend.create_rate(@invalid_attrs)
    end

    test "update_rate/2 with valid data updates the rate" do
      rate = rate_fixture()
      assert {:ok, rate} = Backend.update_rate(rate, @update_attrs)
      assert %Rate{} = rate
      assert rate.pair == "some updated pair"
      assert rate.price == Decimal.new("456.7")
    end

    test "update_rate/2 with invalid data returns error changeset" do
      rate = rate_fixture()
      assert {:error, %Ecto.Changeset{}} = Backend.update_rate(rate, @invalid_attrs)
      assert rate == Backend.get_rate!(rate.id)
    end

    test "delete_rate/1 deletes the rate" do
      rate = rate_fixture()
      assert {:ok, %Rate{}} = Backend.delete_rate(rate)
      assert_raise Ecto.NoResultsError, fn -> Backend.get_rate!(rate.id) end
    end

    test "change_rate/1 returns a rate changeset" do
      rate = rate_fixture()
      assert %Ecto.Changeset{} = Backend.change_rate(rate)
    end
  end
end
