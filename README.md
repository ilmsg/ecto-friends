# EctoFriend

test

    $ mix test
    $ mix test test/ecto_friend/upload_test.exs

run

    $ mix run --no-halt

ในตัว children ของ method start ในไพล์ application.ex ใส่ไว้ทดสอเล่นหลายตัวเลยนะ ถ้าในงาน production แบบนี้คงไม่เหมาะ

    {Plug.Cowboy, scheme: :http, plug: EctoFriend.HelloWorldPlug, options: [port: 7001]},
    {Plug.Cowboy, scheme: :http, plug: EctoFriend.Router, options: [port: 7002]},
    {Plug.Cowboy, scheme: :http, plug: EctoFriend.Upload, options: [port: cowboy_port()]}

EctoFriend.HelloWorldPlug

    http://localhost:7001/          200   Hello World!

EctoFriend.Router

    http://localhost:7002/          200   Welcome
    http://localhost:7002/missing   404   Oops!

EctoFriend.Upload

    http://localhost:7002/          200   Welcome
    http://localhost:7002/upload    201   Uploaded
    http://localhost:7002/missing   404   Oops!



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ecto_friend` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_friend, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ecto_friend>.

---
refer:

  https://hexdocs.pm/ecto/getting-started.html
  
  https://elixirschool.com/en/lessons/misc/plug