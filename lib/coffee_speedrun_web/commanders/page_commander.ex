defmodule CoffeeSpeedrunWeb.PageCommander do
  use Drab.Commander, modules: [Drab.Query]

  defhandler start_stopwatch(socket, _sender) do
    add_seconds(socket, 0, 1)
  end

  def add_seconds(
    socket,
    num_secs,
    num_secs_to_add) do
      update_stopwatch(socket, num_secs + num_secs_to_add)
      :timer.sleep(num_secs_to_add * 1000)
      add_seconds(socket, num_secs + num_secs_to_add, num_secs_to_add)
  end

  def update_stopwatch(socket, new_time) do
    socket
      |> update(:text, set: "#{new_time}", on: "#stopwatch_div")
  end

  defhandler stop_stopwatch(socket, _sender) do
    true
  end
end
