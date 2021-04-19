defmodule ReadingList.Repo do
  use Ecto.Repo,
    otp_app: :reading_list,
    adapter: Ecto.Adapters.Postgres
end
