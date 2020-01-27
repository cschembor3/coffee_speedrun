defmodule CoffeeSpeedrunWeb.Router do
  use CoffeeSpeedrunWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CoffeeSpeedrunWeb do
    pipe_through :browser

    get "/", PageController, :homepage

    get "/coffee", PageController, :index
    resources "/coffee/runners", RunnerController

    get "/cookie", PageController, :index
    resources "/cookie/runners", CookieRunnerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CoffeeSpeedrunWeb do
  #   pipe_through :api
  # end
end
