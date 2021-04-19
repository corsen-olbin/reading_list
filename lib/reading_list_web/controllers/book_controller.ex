defmodule ReadingListWeb.BookController do
  use ReadingListWeb, :controller

  def index(conn, %{"q" => q}) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("https://www.googleapis.com/books/v1/volumes?q=#{q}")
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end
end
