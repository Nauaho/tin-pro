defmodule GofastApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do

    field :name, :string
    field :surname, :string
    field :birthdate, :date
    field :password, :string
    field :email, :string
    field :role, :string

    field :license_number, :string
    field :experience, :integer
    field :salary, :float

    has_many :rentals, GofastApi.Rentals.Rental
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :surname, :birthdate, :password, :email, :role,
                     :license_number, :experience, :salary])
    |> validate_required([:name, :surname, :birthdate, :password, :email])
    #validate email format
    |> validate_format(:email, ~r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
    #validate date format
    # |> validate_format(:birthdate, ~r"~D[^\d{4}-\d{2}-\d{2}]$")
    #validate length of strings
    |> validate_length(:name, max: 30)
    |> validate_length(:surname, max: 30)
    |> validate_length(:password, max: 255)
    |> validate_length(:email, max: 50)
    |> validate_inclusion(:role,
        ["client", "manager", "mechanic", "client-mechanic"])
    |> unique_constraint(:email)
  end
end
