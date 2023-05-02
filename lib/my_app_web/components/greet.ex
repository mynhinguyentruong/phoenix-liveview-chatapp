defmodule MyAppWeb.Greet do

  use Phoenix.Component

  attr :name, :string, required: true
  def greet(assigns) do
    ~H"""
      <p class="text-3xl font-bold hover:bg-yellow-300">Hello, <%= @name%> ! </p>
    """
  end
end
