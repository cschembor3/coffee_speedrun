defmodule CoffeeSpeedrunWeb.RunnerControllerTest do
  use CoffeeSpeedrunWeb.ConnCase

  alias CoffeeSpeedrun.Users

  @create_attrs %{name: "some name", time: ~T[14:00:00]}
  @update_attrs %{name: "some updated name", time: ~T[15:01:01]}
  @invalid_attrs %{name: nil, time: nil}

  def fixture(:runner) do
    {:ok, runner} = Users.create_runner(@create_attrs)
    runner
  end

  describe "index" do
    test "lists all runners", %{conn: conn} do
      conn = get(conn, Routes.runner_path(conn, :index))
      assert html_response(conn, 200)
    end
  end

  describe "new runner" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.runner_path(conn, :new))
      assert html_response(conn, 200)
    end
  end

  describe "create runner" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.runner_path(conn, :create), runner: @create_attrs)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.runner_path(conn, :create), runner: @invalid_attrs)
      assert html_response(conn, 200)
    end
  end

  describe "edit runner" do
    setup [:create_runner]

    test "renders form for editing chosen runner", %{conn: conn, runner: runner} do
      conn = get(conn, Routes.runner_path(conn, :edit, runner))
      assert html_response(conn, 200)
    end
  end

  describe "update runner" do
    setup [:create_runner]

    test "redirects when data is valid", %{conn: conn, runner: runner} do
      conn = put(conn, Routes.runner_path(conn, :update, runner), runner: @update_attrs)
      assert redirected_to(conn) == Routes.runner_path(conn, :show, runner)

      conn = get(conn, Routes.runner_path(conn, :show, runner))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, runner: runner} do
      conn = put(conn, Routes.runner_path(conn, :update, runner), runner: @invalid_attrs)
      assert html_response(conn, 200)
    end
  end

  describe "delete runner" do
    setup [:create_runner]

    test "deletes chosen runner", %{conn: conn, runner: runner} do
      conn = delete(conn, Routes.runner_path(conn, :delete, runner))
      assert redirected_to(conn) == Routes.runner_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.runner_path(conn, :show, runner))
      end
    end
  end

  defp create_runner(_) do
    runner = fixture(:runner)
    {:ok, runner: runner}
  end
end
