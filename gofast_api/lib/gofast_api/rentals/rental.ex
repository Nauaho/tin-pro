defmodule GofastApi.Rentals.Rental do
  use Ecto.Schema

  schema "rentals" do
    field :car, :integer
    field :client, :integer
    field :payment, :float
    field :from, :date
    field :to, :date
  end
end
