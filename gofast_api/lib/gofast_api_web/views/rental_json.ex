defmodule GofastApiWeb.RentalJSON do
  alias GofastApi.Rentals.Rental
  alias GofastApiWeb.ClientJSON

  def index(%{rentals: rentals}) do
    %{clients: for(rental <- rentals, do: data(rental))}
  end

  def show(%{rental: rental}) do
    %{rental: data(rental)}
  end

  def data(%Rental{} = rental) do
    %{
      client: ClientJSON.data(rental.client),
      car: CarJSON.data(rental.car),
      payment: rental.payment,
      from: rental.from,
      to: rental.to
    }
  end

end
