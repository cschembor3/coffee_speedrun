defmodule CoffeeSpeedrun.Repo.Migrations.CreateRunners do
  use Ecto.Migration

  def change do
    create table(:runners) do
      add :name, :string
      add :time, :time

      timestamps()
    end

  end
end
