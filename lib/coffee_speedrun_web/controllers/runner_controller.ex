defmodule CoffeeSpeedrunWeb.RunnerController do
  use CoffeeSpeedrunWeb, :controller

  alias CoffeeSpeedrun.Users
  alias CoffeeSpeedrun.Users.Runner

  def index(conn, _params) do
    conn = assign(conn, :run_type, "coffee")
    runners = Users.list_runners()
    render(conn, "index.html", runners: runners)
  end

  def new(conn, _params) do
    changeset = Users.change_runner(%Runner{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"runner" => runner_params}) do
    case Users.create_runner(runner_params) do
      {:ok, runner} ->
        conn
        |> put_flash(:info, "Runner created successfully.")
        |> render("index.html", runners: Users.list_runners())

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    runner = Users.get_runner!(id)
    render(conn, "show.html", runner: runner)
  end

  def edit(conn, %{"id" => id}) do
    runner = Users.get_runner!(id)
    changeset = Users.change_runner(runner)
    render(conn, "edit.html", runner: runner, changeset: changeset)
  end

  def update(conn, %{"id" => id, "runner" => runner_params}) do
    runner = Users.get_runner!(id)

    case Users.update_runner(runner, runner_params) do
      {:ok, runner} ->
        conn
        |> put_flash(:info, "Runner updated successfully.")
        |> redirect(to: Routes.runner_path(conn, :show, runner))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", runner: runner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    runner = Users.get_runner!(id)
    {:ok, _runner} = Users.delete_runner(runner)

    conn
    |> put_flash(:info, "Runner deleted successfully.")
    |> redirect(to: Routes.runner_path(conn, :index))
  end
end
