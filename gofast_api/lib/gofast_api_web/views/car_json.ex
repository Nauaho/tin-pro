defmodule GofastApiWeb.CarJSON do
  alias GofastApi.Cars.Car
  alias GofastApiWeb.MechanicJSON

  def index(%{cars: cars}) do
    %{cars: for(car <- cars, do: data(car))}
  end

  def show(%{car: car}) do
    %{car: data(car)}
  end

  def data(%Car{} = car) do
    %{
      id: car.id,
      year_of_production: car.year_of_production,
      type: car.type.type,
      description: car.description,
      image: car.image,
      image_name: car.image_name,
      mechanic: MechanicJSON.data(car.user),
    }
  end

end
