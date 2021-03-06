defmodule App.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :is_bot, :boolean
    field :bot_difficulty, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :email, :password, :is_bot, :bot_difficulty])
    |> unique_constraint(:name)
    |> validate_required([:name, :password])
  end
end
