defmodule HelloWeb.MyFallbackController do
  use Phoenix.Controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(HelloWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(403)
    |> put_view(ReadingListWeb.ErrorView)
    |> render(:"403")
  end

  def call(conn, {:error, :notimplemented}) do
    conn
    |> put_status(501)
    |> put_view(ReadingListWeb.ErrorView)
    |> render(:"501")
  end
end
