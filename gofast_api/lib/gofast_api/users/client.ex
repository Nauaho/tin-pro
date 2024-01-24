defmodule GofastApi.Users.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client" do
    field :licence_number, :string, size: (30)
    be
  end
end
