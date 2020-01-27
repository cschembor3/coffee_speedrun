defmodule CoffeeSpeedrunWeb.CookieRunnerController do
  use CoffeeSpeedrunWeb, :controller

  alias CoffeeSpeedrun.Users
  alias CoffeeSpeedrun.Users.CookieRunner

  def index(conn, _params) do
    conn = assign(conn, :run_type, "cookie")
    cookie_runners = Users.list_cookie_runners()
    render(conn, "index.html", cookie_runners: cookie_runners)
  end

  def new(conn, _params) do
    changeset = Users.change_cookie_runner(%CookieRunner{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cookie_runner" => cookie_runner_params}) do
    case Users.create_cookie_runner(cookie_runner_params) do
      {:ok, cookie_runner} ->
        conn
        |> put_flash(:info, "Cookie runner created successfully.")
        |> render("index.html", cookie_runners: Users.list_cookie_runners())

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cookie_runner = Users.get_cookie_runner!(id)
    render(conn, "show.html", cookie_runner: cookie_runner)
  end

  def edit(conn, %{"id" => id}) do
    cookie_runner = Users.get_cookie_runner!(id)
    changeset = Users.change_cookie_runner(cookie_runner)
    render(conn, "edit.html", cookie_runner: cookie_runner, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cookie_runner" => cookie_runner_params}) do
    cookie_runner = Users.get_cookie_runner!(id)

    case Users.update_cookie_runner(cookie_runner, cookie_runner_params) do
      {:ok, cookie_runner} ->
        conn
        |> put_flash(:info, "Cookie runner updated successfully.")
        |> redirect(to: Routes.cookie_runner_path(conn, :show, cookie_runner))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cookie_runner: cookie_runner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cookie_runner = Users.get_cookie_runner!(id)
    {:ok, _cookie_runner} = Users.delete_cookie_runner(cookie_runner)

    conn
    |> put_flash(:info, "Cookie runner deleted successfully.")
    |> redirect(to: Routes.cookie_runner_path(conn, :index))
  end
end
