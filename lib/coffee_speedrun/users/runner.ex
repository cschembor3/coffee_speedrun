defmodule CoffeeSpeedrun.Users.Runner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "runners" do
    field :name, :string
    field :time, :time

    timestamps()
  end

  @doc false
  def changeset(runner, attrs) do
    runner
    |> cast(attrs, [:name, :time])
    |> validate_required([:name, :time])
  end
end
