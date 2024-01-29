defmodule GofastApi.Users.Mechanic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mechanics" do
    field :experience, :integer
    field :salary, :float
  end

  def changeset(mechanic, params) do

  end
end
