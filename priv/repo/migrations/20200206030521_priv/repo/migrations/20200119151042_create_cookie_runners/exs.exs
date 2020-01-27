defmodule :"Elixir.CoffeeSpeedrun.Repo.Migrations.Priv.Repo.Migrations.20200119151042CreateCookieRunners.exs" do
  use Ecto.Migration

  def change do
    alter table(:cookie_runners) do
      modify :time, :time
    end
  end

end
