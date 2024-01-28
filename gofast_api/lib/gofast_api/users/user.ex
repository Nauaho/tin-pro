defmodule GofastApi.Users.User do
    use Ecto.Schema
    import Ecto.Changeset

    field :id, :id
    field :name, :string
    field :surname, :string
    field :birthdate, :datetime
    field :password, :string
    field :email, :string

    def changeset(user, params ) do

    end
end
