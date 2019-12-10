defmodule CoffeeSpeedrun.Repo do
  use Ecto.Repo,
    otp_app: :coffee_speedrun,
    adapter: Ecto.Adapters.Postgres
end
