defmodule GofastApiWeb.MechanicController do
  use GofastApiWeb, :controller
  alias GofastApi.Users
	alias GofastApi.Users.User

  action_fallback GofastApiWeb.FallbackController

  def index(conn, _params) do
    render(conn, :index, mechanics: Users.list_mechanics)
  end

  def create(conn, %{"mechanic" => params}) do
    with {:ok, %User{} = mechanic} <- Users.create_user(params) do
      conn
        |> put_status(:created)
        |> put_resp_header("location", ~p"/api/mechanics/#{mechanic}")
        |> render(:show, mechanic: mechanic)
    end
  end

  def show(conn, %{"id" => id}) do
    mechanic = String.to_integer(id) |> Users.get_mechanic!()
    render(conn, :show, mechanic: mechanic)
  end

  def delete(conn, %{"id" => id}) do
    mechanic = String.to_integer(id) |> Users.get_mechanic!()

    with {:ok, %User{}} <-Users.delete_user(mechanic) do
      send_resp(conn, :no_content, "")
    end
  end

  def update(conn, %{"id" => id, "mechanic" => params}) do
    mechanic = Users.get_mechanic!(id)

    with {:ok, %User{} = mechanic} <- Users.update_user(mechanic, params) do
      render(conn, :show, mechanic: mechanic)
    end

  end

end
