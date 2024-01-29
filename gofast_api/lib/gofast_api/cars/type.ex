defmodule GofastApi.Cars.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "types" do
    field :type, :string
  end
end
