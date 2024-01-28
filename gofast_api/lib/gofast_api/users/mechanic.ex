defmodule GofastApi.Users.Mechanic do
    use Ecto.Schema
    import Ecto.Changeset

    field :expirience, :integer
    field :salary, :money

    def changeset(mechanic, params) do

    end
end
