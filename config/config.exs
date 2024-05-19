import Config

config :ecto_friend, EctoFriend.Repo,
  database: "ecto_friend_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ecto_friend,
  ecto_repos: [EctoFriend.Repo]

config :ecto_friend,
  cowboy_port: 7003
