defmodule GofastApiWeb.ClientController do
	  use GofastApiWeb, :controller
		alias GofastApi.Users

  	def index(conn, _params) do
    	render(conn, :index, clients: Users.list_clients)
  	end

		def create(conn, %{"client" => post_params}) do

		end

		def show(conn, %{"id" => id}) do
			client = String.to_integer(id) |> Users.get_client()
			render(conn, :show, client: client)
		end

		def delete(conn, _params) do

		end

		def update(conn, _params) do

		end

end
