defmodule GofastApiWeb.ClientJSON do
  alias GofastApi.Users.Client

  def index(%{clients: clients}) do
    %{data: for(client <- clients, do: data(client))}
  end

  def show(%{client: client}) do
    %{data: data(client)}
  end

  def data(%Client{} = client) do
    %{
      id: client.user_id,
      name: client.user.name,
      surname: client.user.surname,
      birthdate: client.user.birthdate,
      email: client.user.email,
      license: client.licence_number,
    }
  end

end
