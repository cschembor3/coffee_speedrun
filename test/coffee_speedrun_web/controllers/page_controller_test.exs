defmodule CoffeeSpeedrunWeb.PageControllerTest do
  use CoffeeSpeedrunWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200)
  end
end
