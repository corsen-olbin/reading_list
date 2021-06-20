defmodule ReadingList.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :google_id, :string
    field :isbn_13, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:google_id, :isbn_13, :status])
    |> validate_required([:google_id, :isbn_13, :status])
  end
end
