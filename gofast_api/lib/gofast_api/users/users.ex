defmodule GofastApi.Users do
  alias GofastApi.Repo
  alias GofastApi.Users.User
  import Ecto.Query

  def list_clients() do
    Repo.all( from u in User,
              where: u.role == "client"
                or u.role == "client-mechanic")
  end

  def get_client!(user_id) do
    Repo.one( from u in User,
              where: u.id == ^user_id and
                u.role == "client"
                or u.role == "client-mechanic")
  end

  def list_mechanics() do
    Repo.all( from u in User,
              where: u.role == "mechanic"
                or u.role == "client-mechanic")
  end

  def get_mechanic!(user_id) do
    Repo.one( from u in User,
              where: u.id == ^user_id and
                u.role == "mechanic"
                or u.role == "client-mechanic")
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def create_user(params \\ %{}) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def update_user(%User{} = user, params \\ %{}) do
   user
    |> User.changeset(params)
    |> Repo.update()
  end
end
