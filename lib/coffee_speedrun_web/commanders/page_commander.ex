defmodule CoffeeSpeedrunWeb.PageCommander do
  use Drab.Commander
  use Drab.Commander, modules: [Drab.Query, Drab.Modal, Drab.Live, Drab.Core]

  defhandler start_stopwatch(socket, _sender) do
    Process.register(spawn(fn -> increment_timer(socket, ~T[00:00:00]) end), :testing)
  end

  defhandler stop_stopwatch(socket, sender) do
    IO.inspect(:testing)
    send(:testing, :cancel_timer)
  end

  def increment_timer(socket, time) do
    update_stopwatch(socket, Time.add(time, 1))
    :timer.sleep(1 * 1000)

    receive do
      :cancel_timer ->
        socket |> update(:text, set: "how do you do", on: "#stopwatch_div")
    after
      0 ->
        increment_timer(socket, Time.add(time, 1))
    end
  end

  def update_stopwatch(socket, new_time) do
    socket
    |> update(:text, set: "#{format_time(new_time)}", on: "#stopwatch_div")
  end

  def format_time(time) do
    Calendar.ISO.time_to_string(
      time.hour,
      time.minute,
      time.second,
      {0, 0}
    )
  end
end
