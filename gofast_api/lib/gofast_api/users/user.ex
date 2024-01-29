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

  end
end
