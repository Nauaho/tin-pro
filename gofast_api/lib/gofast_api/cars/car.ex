defmodule GofastApi.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :type, :integer
    field :description, :string
    field :year_of_production, :date
    field :mechanic, :integer
    field :image, :binary
    field :image_name, :string
  end

end
