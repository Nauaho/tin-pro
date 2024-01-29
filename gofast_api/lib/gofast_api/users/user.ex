defmodule GofastApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :surname, :string
    field :birthdate, :date
    field :password, :string
    field :email, :string
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :surname, :birthdate, :password, :email])
    |> validate_required([:name, :surname, :birthdate, :password, :email])
    |> validate_format(:email, ~r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
    #validate length of strings
    |> validat_length()
    #validate date format
    |> unique_constraint(:email)
  end
end
