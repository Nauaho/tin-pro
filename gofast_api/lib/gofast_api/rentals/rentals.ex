defmodule GofastApi.Rentals.Rentals do
  use Ecto.Schema

  field :car, :integer
  field :client, :integer
  field :payment, :money
  field :from, :date
  field :to, :date
end
