defmodule CoffeeSpeedrun.Users.CookieRunner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cookie_runners" do
    field :name, :string
    field :time, :time

    timestamps()
  end

  @doc false
  def changeset(cookie_runner, attrs) do
    cookie_runner
    |> cast(attrs, [:name, :time])
    |> validate_required([:name, :time])
  end
end
