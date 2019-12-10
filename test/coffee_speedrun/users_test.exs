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
end
