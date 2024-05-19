defmodule EctoFriend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: EctoFriend.Worker.start_link(arg)
      # {EctoFriend.Worker, arg}
      EctoFriend.Repo,
      {Plug.Cowboy, scheme: :http, plug: EctoFriend.HelloWorldPlug, options: [port: 7001]},
      {Plug.Cowboy, scheme: :http, plug: EctoFriend.Router, options: [port: 7002]},
      {Plug.Cowboy, scheme: :http, plug: EctoFriend.Upload, options: [port: cowboy_port()]}
    ]

    Logger.info("Starting application...")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoFriend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:EctoFriend, :cowboy_port, 7003)
end
