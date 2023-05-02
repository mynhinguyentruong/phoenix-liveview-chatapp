defmodule MyAppWeb.LightLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, brightness: 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p class="text-3xl font-bold hover:bg-yellow-300"> <%= @brightness %> </p>
    """
  end
end
