defmodule LiveViewNative.SwiftUI.TemplateRenderTest do
  use ExUnit.Case, async: false

  import Phoenix.ConnTest
  import Plug.Conn, only: [put_req_header: 3]
  import Phoenix.LiveViewTest

  @endpoint LiveViewNativeTest.Endpoint

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "can render the override swiftui format", %{conn: conn} do
    conn = put_req_header(conn, "accept", "text/swiftui")
    {:ok, lv, _body} = live(conn, "/template")

    assert lv |> element("text") |> render() =~ "Template SwiftUI Render 100"
  end

  test "can render the override swiftui format with watchos target", %{conn: conn} do
    conn = put_req_header(conn, "accept", "text/swiftui")
    {:ok, lv, _body} = live(conn, "/template?_interface[target]=watchos")

    assert lv |> element("text") |> render() =~ "WatchOS Target Template SwiftUI Render 100"
  end
end