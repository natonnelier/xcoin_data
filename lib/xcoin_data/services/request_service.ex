defmodule XcoinData.Services.RequestService do
  @moduledoc """
  RequestService.
  """

  def get_public_request(url) do
    HTTPoison.start
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)
      {:ok, %HTTPoison.Response{body: body, request_url: url, status_code: 520}} ->
        %{"error" => %{"status" => 520}}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        %{"error" => %{"status" => 404}}
      {:error, %HTTPoison.Error{reason: reason}} ->
        %{"error" => %{"status" => 500, "reason" => "failed on exchanges API"}}
      _ ->
        %{"error" => %{"status" => 520}}
    end
  end

end
