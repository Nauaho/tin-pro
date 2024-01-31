defmodule GofastApiWeb.ClientJSON do
  alias GofastApi.Users.User

  def index(%{clients: clients}) do
    %{clients: for(client <- clients, do: data(client))}
  end

  def show(%{client: client}) do
    %{client: data(client)}
  end

  def data(%User{} = client) do
    %{
      id: client.id,
      name: client.name,
      surname: client.surname,
      birthdate: client.birthdate,
      email: client.email,
      license_number: client.license_number,
      role: client.role
    }
  end
end
