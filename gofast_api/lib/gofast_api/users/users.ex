defmodule GofastApi.Users do
  alias GofastApi.Repo
  alias GofastApi.Users.User
  alias GofastApi.Users.Client
  import Ecto.Query

  def list_clients() do
    Repo.all(from c in Client, preload: [:user])
  end

  def get_client!(id) do
    Repo.get!(Client, id) |> Repo.preload(:user)
  end

  def delete_client(id) do

  end

end
