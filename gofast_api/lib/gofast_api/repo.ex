defmodule GofastApi.Repo do
  use Ecto.Repo,
    otp_app: :gofast_api,
    adapter: Ecto.Adapters.Postgres
end
