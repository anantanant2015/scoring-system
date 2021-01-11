defmodule Scoringsystem.Repo do
  use Ecto.Repo,
    otp_app: :scoringsystem,
    adapter: Ecto.Adapters.Postgres
end
