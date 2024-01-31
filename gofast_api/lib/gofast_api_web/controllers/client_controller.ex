defmodule GofastApiWeb.ClientController do
	  use GofastApiWeb, :controller
		alias GofastApi.Users
		alias GofastApi.Users.User

		action_fallback GofastApiWeb.FallbackController

  	def index(conn, _params) do
    	render(conn, :index, clients: Users.list_clients)
  	end

		def create(conn, %{"client" => params}) do
			with {:ok, %User{} = client} <- Users.create_user(params) do
				conn
					|> put_status(:created)
					|> put_resp_header("location", ~p"/api/clients/#{client}")
					|> render(:show, client: client)
			end
		end

		def show(conn, %{"id" => id}) do
			client = String.to_integer(id) |> Users.get_client!()
			render(conn, :show, client: client)
		end

		def delete(conn, %{"id" => id}) do
			client = String.to_integer(id) |> Users.get_client!()

			with {:ok, %User{}} <-Users.delete_user(client) do
				send_resp(conn, :no_content, "")
			end
		end

		def update(conn, %{"id" => id, "client" => params}) do
			client = Users.get_client!(id)

			with {:ok, %User{} = client} <- Users.update_user(client, params) do
				render(conn, :show, client: client)
			end

		end

end
