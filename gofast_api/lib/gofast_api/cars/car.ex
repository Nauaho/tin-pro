defmodule GofastApi.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :type, :integer
    field :description, :string
    field :year_of_production, :date
    field :image, :binary
    field :image_name, :string

    has_many :rentals, GofastApi.Rentals.Rental
  end

  def changeset(rental, params) do
    rental
    |> cast(params, [:type, :description,
                     :year_of_production,
                     :user_id, :image,
                     :image_name])
    |> validate_required([:type, :description,
                          :year_of_production,
                          :user_id, :image,
                          :image_name])
  end

end
