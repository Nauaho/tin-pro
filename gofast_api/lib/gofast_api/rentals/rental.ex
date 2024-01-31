defmodule GofastApi.Rentals.Rental do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rentals" do
    field :payment, :float
    field :from, :date
    field :to, :date

    belongs_to :user, GofastApi.Users.User
    belongs_to :car, GofastApi.Cars.Car
  end

  def changeset(rental, params) do
    rental
    |> cast(params, [:car_id, :user_id, :from, :to, :payment])
    |> validate_required([:car_id, :user_id, :from, :to, :payment])
    |> validate_number(:payment, greater_than: 0)
  end
end
