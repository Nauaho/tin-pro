defmodule GofastApiWeb.FallbackController do
  use GofastApiWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: GofastApiWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view( json: GofastApiWeb.ErrorJSON)
    |> render(:"404")
  end

  def call(conn, {:error, :conflict}) do
    conn
    |> put_status(:conflict)
    |> put_view( json: GofastApiWeb.ErrorJSON)
    |> render(:"401")
  end
end
