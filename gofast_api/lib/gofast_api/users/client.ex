defmodule GofastApi.Users.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "clients" do
    field :licence_number, :string
    belongs_to :user, GofastApi.Users.User, primary_key: true
  end

  def changeset(client, params) do
    client
    |> cast(params, [:licence_number, :user_id])
    |> validate_required([:licence_number, :user_id])
    |> validate_length( max: 30)
    |> unique_constraint(:user_id)
  end
end
