defmodule ReadingListWeb.BookController do
  use ReadingListWeb, :controller

  def index(conn, params) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("https://www.googleapis.com/books/v1/volumes?q=#{get_in(params, ["query"])}")
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end
end
