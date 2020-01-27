defmodule CoffeeSpeedrunWeb.PageController do
  use CoffeeSpeedrunWeb, :controller

  def index(conn, _params) do
    runner_type = if conn.request_path =~ "coffee" do
      "coffee"
     else
       "cookie"
     end

    conn = assign(conn, :run_type, runner_type)
    IO.puts(runner_type)
    render(conn, "index.html", run_type: runner_type)
  end

  def homepage(conn, _params) do
    redirect conn, to: "/homepage.html"
  end
end
