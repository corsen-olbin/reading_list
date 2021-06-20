defmodule ReadingList.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :google_id, :string
      add :isbn_13, :string
      add :status, :string

      timestamps()
    end

  end
end
