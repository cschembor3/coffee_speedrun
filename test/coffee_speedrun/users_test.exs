defmodule CoffeeSpeedrun.UsersTest do
  use CoffeeSpeedrun.DataCase

  alias CoffeeSpeedrun.Users

  describe "runners" do
    alias CoffeeSpeedrun.Users.Runner

    @valid_attrs %{name: "some name", time: ~T[14:00:00]}
    @update_attrs %{name: "some updated name", time: ~T[15:01:01]}
    @invalid_attrs %{name: nil, time: nil}

    def runner_fixture(attrs \\ %{}) do
      {:ok, runner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_runner()

      runner
    end

    test "list_runners/0 returns all runners" do
      runner = runner_fixture()
      assert Users.list_runners() == [runner]
    end

    test "get_runner!/1 returns the runner with given id" do
      runner = runner_fixture()
      assert Users.get_runner!(runner.id) == runner
    end

    test "create_runner/1 with valid data creates a runner" do
      assert {:ok, %Runner{} = runner} = Users.create_runner(@valid_attrs)
      assert runner.name == "some name"
      assert runner.time == ~T[14:00:00]
    end

    test "create_runner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_runner(@invalid_attrs)
    end

    test "update_runner/2 with valid data updates the runner" do
      runner = runner_fixture()
      assert {:ok, %Runner{} = runner} = Users.update_runner(runner, @update_attrs)
      assert runner.name == "some updated name"
      assert runner.time == ~T[15:01:01]
    end

    test "update_runner/2 with invalid data returns error changeset" do
      runner = runner_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_runner(runner, @invalid_attrs)
      assert runner == Users.get_runner!(runner.id)
    end

    test "delete_runner/1 deletes the runner" do
      runner = runner_fixture()
      assert {:ok, %Runner{}} = Users.delete_runner(runner)
      assert_raise Ecto.NoResultsError, fn -> Users.get_runner!(runner.id) end
    end

    test "change_runner/1 returns a runner changeset" do
      runner = runner_fixture()
      assert %Ecto.Changeset{} = Users.change_runner(runner)
    end
  end

  describe "cookie_runners" do
    alias CoffeeSpeedrun.Users.CookieRunner

    @valid_attrs %{name: "some name", time: ~T[14:00:00]}
    @update_attrs %{name: "some updated name", time: ~T[15:01:01]}
    @invalid_attrs %{name: nil, time: nil}

    def cookie_runner_fixture(attrs \\ %{}) do
      {:ok, cookie_runner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_cookie_runner()

      cookie_runner
    end

    test "list_cookie_runners/0 returns all cookie_runners" do
      cookie_runner = cookie_runner_fixture()
      assert Users.list_cookie_runners() == [cookie_runner]
    end

    test "get_cookie_runner!/1 returns the cookie_runner with given id" do
      cookie_runner = cookie_runner_fixture()
      assert Users.get_cookie_runner!(cookie_runner.id) == cookie_runner
    end

    test "create_cookie_runner/1 with valid data creates a cookie_runner" do
      assert {:ok, %CookieRunner{} = cookie_runner} = Users.create_cookie_runner(@valid_attrs)
      assert cookie_runner.name == "some name"
<<<<<<< HEAD
      assert cookie_runner.time == ~T[14:00:00]
=======
      assert cookie_runner.time == "some time"
>>>>>>> heroku/master
    end

    test "create_cookie_runner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_cookie_runner(@invalid_attrs)
    end

    test "update_cookie_runner/2 with valid data updates the cookie_runner" do
      cookie_runner = cookie_runner_fixture()
      assert {:ok, %CookieRunner{} = cookie_runner} = Users.update_cookie_runner(cookie_runner, @update_attrs)
      assert cookie_runner.name == "some updated name"
<<<<<<< HEAD
      assert cookie_runner.time == ~T[15:01:01]
=======
      assert cookie_runner.time == "some updated time"
>>>>>>> heroku/master
    end

    test "update_cookie_runner/2 with invalid data returns error changeset" do
      cookie_runner = cookie_runner_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_cookie_runner(cookie_runner, @invalid_attrs)
      assert cookie_runner == Users.get_cookie_runner!(cookie_runner.id)
    end

    test "delete_cookie_runner/1 deletes the cookie_runner" do
      cookie_runner = cookie_runner_fixture()
      assert {:ok, %CookieRunner{}} = Users.delete_cookie_runner(cookie_runner)
      assert_raise Ecto.NoResultsError, fn -> Users.get_cookie_runner!(cookie_runner.id) end
    end

    test "change_cookie_runner/1 returns a cookie_runner changeset" do
      cookie_runner = cookie_runner_fixture()
      assert %Ecto.Changeset{} = Users.change_cookie_runner(cookie_runner)
    end
  end
end
