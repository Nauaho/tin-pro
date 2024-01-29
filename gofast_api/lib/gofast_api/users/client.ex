defmodule GofastApi.Users.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "clients" do
    field :licence_number, :string
    belongs_to :user, GofastApi.Users.User, primary_key: true
  end

  #
  # @foreign_key_type :integer
end
