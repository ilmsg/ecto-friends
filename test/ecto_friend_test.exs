defmodule EctoFriendTest do
  use ExUnit.Case
  doctest EctoFriend

  test "greets the world" do
    assert EctoFriend.hello() == :world
  end
end
