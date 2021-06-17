defmodule ReadingListWeb.SearchController do
  use ReadingListWeb, :controller

  def index(conn, params) do
    case HTTPoison.get("https://www.googleapis.com/books/v1/volumes?q=#{:http_uri.encode(params["query"])}") do
      {:ok, %HTTPoison.Response{status_code: _code, body: body}} -> render(conn, "index.html", books: decode(body))
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  def decode(body) do
    body
    |> Poison.decode(keys: :atoms)
    |> case do
        {:ok, parsed} -> parsed
        _ -> body
    end
  end
end
