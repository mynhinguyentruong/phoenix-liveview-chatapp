defmodule MyAppWeb.LightLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, brightness: 10)
    IO.puts("In def mount")
    dbg(_params)
    dbg(_session)
    dbg(socket)
    {:ok, socket}
  end

  def render(assigns) do
    dbg(assigns)
    ~H"""
    <p class="text-3xl font-bold hover:bg-yellow-300"> <%= @brightness %> </p>
    <button phx-click="click">Click me!</button>
    """
  end

  def handle_event("click", _value, socket) do

    socket = assign(socket, brightness: 100)
    IO.inspect(socket)
    {:noreply, socket}
  end
end
