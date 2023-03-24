defmodule Cool.Repo do
  use Ecto.Repo,
    otp_app: :cool,
    adapter: Ecto.Adapters.Postgres
end
