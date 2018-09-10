defmodule XcoinData.Services.RequestService do
  @moduledoc """
  RequestService.
  """

  def get_public_request(url) do
    HTTPoison.start
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        %{"error" => %{"status" => 404}}
      {:error, %HTTPoison.Error{reason: reason}} ->
        %{"error" => %{"status" => 500, "reason" => reason}}
    end
  end

end
