defmodule CoffeeSpeedrunWeb.PageController do
  use CoffeeSpeedrunWeb, :controller
  use Drab.Controller, commanders: [CoffeeSpeedrunWeb.PageCommander]

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
