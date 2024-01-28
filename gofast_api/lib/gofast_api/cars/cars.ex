defmodule GofastApi.Cars.Cars do
  use Ecto.Schema
  import Ecto.Changeset

  field :type, :integer
  field :description, :text
  field :year_of_production, :date
  field :mechanic, :integer
  field :image, :bytea
  field :image_name, :string

end
