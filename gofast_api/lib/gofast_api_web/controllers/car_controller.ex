defmodule GofastApiWeb.CarController do
  use GofastApiWeb, :controller
  alias GofastApi.Cars
	alias GofastApi.Cars.Car

  action_fallback GofastApiWeb.FallbackController

  def index(conn, _params) do
    render(conn, :index, cars: Cars.list_cars)
  end

  def create(conn, %{"car" => params}) do
    with {:ok, %Car{} = car} <- Cars.create_car(params) do
      conn
        |> put_status(:created)
        |> put_resp_header("location", ~p"/api/cars/#{car}")
        |> render(:show, car: car)
    end
  end

  def show(conn, %{"id" => id}) do
    car = String.to_integer(id) |> Cars.get_car!()
    render(conn, :show, car: car)
  end

  def delete(conn, %{"id" => id}) do
    car = String.to_integer(id) |> Cars.get_car!()

    with {:ok, %Car{}} <-Cars.delete_Car(car) do
      send_resp(conn, :no_content, "")
    end
  end

  def update(conn, %{"id" => id, "car" => params}) do
    car = Cars.get_car!(id)

    with {:ok, %Car{} = car} <- Cars.update_car(car, params) do
      render(conn, :show, car: car)
    end

  end

end
