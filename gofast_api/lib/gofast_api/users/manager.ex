defmodule GofastApi.Users.Manager do
  use Ecto.Schema
  import Ecto.Changeset

  schema "managers" do
    field :from, :date
    field :to, :date
  end

  def changeset() do

  end
end
