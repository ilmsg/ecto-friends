defmodule EctoFriend.Repo do
  use Ecto.Repo,
    otp_app: :ecto_friend,
    adapter: Ecto.Adapters.Postgres
end
