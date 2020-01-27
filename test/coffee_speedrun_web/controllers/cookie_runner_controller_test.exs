defmodule CoffeeSpeedrunWeb.CookieRunnerControllerTest do
  use CoffeeSpeedrunWeb.ConnCase

  alias CoffeeSpeedrun.Users

  @create_attrs %{name: "some name", time: "some time"}
  @update_attrs %{name: "some updated name", time: "some updated time"}
  @invalid_attrs %{name: nil, time: nil}

  def fixture(:cookie_runner) do
    {:ok, cookie_runner} = Users.create_cookie_runner(@create_attrs)
    cookie_runner
  end

  describe "index" do
    test "lists all cookie_runners", %{conn: conn} do
      conn = get(conn, Routes.cookie_runner_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cookie runners"
    end
  end

  describe "new cookie_runner" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cookie_runner_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cookie runner"
    end
  end

  describe "create cookie_runner" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cookie_runner_path(conn, :create), cookie_runner: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cookie_runner_path(conn, :show, id)

      conn = get(conn, Routes.cookie_runner_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cookie runner"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cookie_runner_path(conn, :create), cookie_runner: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cookie runner"
    end
  end

  describe "edit cookie_runner" do
    setup [:create_cookie_runner]

    test "renders form for editing chosen cookie_runner", %{conn: conn, cookie_runner: cookie_runner} do
      conn = get(conn, Routes.cookie_runner_path(conn, :edit, cookie_runner))
      assert html_response(conn, 200) =~ "Edit Cookie runner"
    end
  end

  describe "update cookie_runner" do
    setup [:create_cookie_runner]

    test "redirects when data is valid", %{conn: conn, cookie_runner: cookie_runner} do
      conn = put(conn, Routes.cookie_runner_path(conn, :update, cookie_runner), cookie_runner: @update_attrs)
      assert redirected_to(conn) == Routes.cookie_runner_path(conn, :show, cookie_runner)

      conn = get(conn, Routes.cookie_runner_path(conn, :show, cookie_runner))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, cookie_runner: cookie_runner} do
      conn = put(conn, Routes.cookie_runner_path(conn, :update, cookie_runner), cookie_runner: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cookie runner"
    end
  end

  describe "delete cookie_runner" do
    setup [:create_cookie_runner]

    test "deletes chosen cookie_runner", %{conn: conn, cookie_runner: cookie_runner} do
      conn = delete(conn, Routes.cookie_runner_path(conn, :delete, cookie_runner))
      assert redirected_to(conn) == Routes.cookie_runner_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cookie_runner_path(conn, :show, cookie_runner))
      end
    end
  end

  defp create_cookie_runner(_) do
    cookie_runner = fixture(:cookie_runner)
    {:ok, cookie_runner: cookie_runner}
  end
end
