defmodule CoffeeSpeedrun.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :name, :string

      timestamps()
    end

  end
end
