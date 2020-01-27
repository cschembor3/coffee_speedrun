defmodule CoffeeSpeedrun.Repo.Migrations.CreateCookieRunners do
  use Ecto.Migration

  def change do
    create table(:cookie_runners) do
      add :name, :string
      add :time, :time

      timestamps()
    end

  end
end
