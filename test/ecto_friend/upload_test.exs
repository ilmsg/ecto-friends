defmodule EctoFriend.UploadTest do
  use ExUnit.Case
  use Plug.Test

  alias EctoFriend.Upload

  @content "<html><body>Hi!</body></html>"
  @mimetype "text/html"

  @opts Upload.init([])

  test "returns welcome" do
    conn =
      :get
      |> conn("/", "")
      |> Upload.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "returns uploaded" do
    conn =
      :get
      |> conn("/upload?content=#{@content}&mimetype=#{@mimetype}")
      |> Upload.call(@opts)

    assert conn.state == :sent
    assert conn.status == 201
  end

  test "returns 404" do
    conn =
      :get
      |> conn("/missing", "")
      |> Upload.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
  end
end
