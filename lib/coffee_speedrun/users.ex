defmodule CoffeeSpeedrun.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias CoffeeSpeedrun.Repo

  alias CoffeeSpeedrun.Users.Runner

  @doc """
  Returns the list of runners.

  ## Examples

      iex> list_runners()
      [%Runner{}, ...]

  """
  def list_runners do
    Repo.all(Runner)
  end

  @doc """
  Gets a single runner.

  Raises `Ecto.NoResultsError` if the Runner does not exist.

  ## Examples

      iex> get_runner!(123)
      %Runner{}

      iex> get_runner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_runner!(id), do: Repo.get!(Runner, id)

  @doc """
  Creates a runner.

  ## Examples

      iex> create_runner(%{field: value})
      {:ok, %Runner{}}

      iex> create_runner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_runner(attrs \\ %{}) do
    %Runner{}
    |> Runner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a runner.

  ## Examples

      iex> update_runner(runner, %{field: new_value})
      {:ok, %Runner{}}

      iex> update_runner(runner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_runner(%Runner{} = runner, attrs) do
    runner
    |> Runner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Runner.

  ## Examples

      iex> delete_runner(runner)
      {:ok, %Runner{}}

      iex> delete_runner(runner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_runner(%Runner{} = runner) do
    Repo.delete(runner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking runner changes.

  ## Examples

      iex> change_runner(runner)
      %Ecto.Changeset{source: %Runner{}}

  """
  def change_runner(%Runner{} = runner) do
    Runner.changeset(runner, %{})
  end
end
