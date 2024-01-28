defmodule GofastApi.Users.Manager do
    use Ecto.Schema
    import Ecto.Changeset

    field :from, :date
    field :to, :date

    def changeset() do

    end
end
