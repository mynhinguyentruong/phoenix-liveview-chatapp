defmodule MyAppWeb.HelloHTML do
  use MyAppWeb, :html

  def index(assigns) do
    ~H"""
      <p>HELLO</p>
    """
  end
end
