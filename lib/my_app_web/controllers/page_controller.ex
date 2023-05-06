defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    dbg(conn)
    dbg(_params)
    render(conn, :shit, layout: false)
  end

  def shit(conn, _params) do
    render(conn, :shit, layout: false)
  end

end
