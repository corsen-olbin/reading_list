defmodule ReadingListWeb.MyListController do
  use ReadingListWeb, :controller

  action_fallback HelloWeb.MyFallbackController

  def index(_conn, _params) do
    { :error, :notimplemented }
  end
end
