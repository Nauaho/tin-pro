defmodule GofastApiWeb.MechanicJSON do
  alias GofastApi.Users.User

  def index(%{mechanics: mechanics}) do
    %{mechanics: for(mechanic <- mechanics, do: data(mechanic))}
  end

  def show(%{mechanic: mechanic}) do
    %{mechanic: data(mechanic)}
  end

  def data(%User{} = mechanic) do
    %{
      id: mechanic.id,
      name: mechanic.name,
      surname: mechanic.surname,
      birthdate: mechanic.birthdate,
      email: mechanic.email,
      license_number: mechanic.license_number,
      role: mechanic.role
    }
  end
end
