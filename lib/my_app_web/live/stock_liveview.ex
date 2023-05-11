defmodule MyAppWeb.StockLiveview do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
#    companies = MyModule.get_companies()
    {:ok, assign(socket, :form, %{email: "", username: ""})}
  end

  def render(assigns) do
    assigns = assign(assigns, :users, [%{id: 1, username: "Nhi"}, %{id: 1, username: "Nhi"}, %{id: 1, username: "Nhi"}])
    dbg(assigns.form)
    ~H"""
      <.table id="users" rows={@users}>
        <:col :let={user} label="Symbol"><%= user.id %></:col>
        <:col :let={user} label="Name"><%= user.username %></:col>
      </.table>

      <.simple_form for={@form} phx-change="validate" phx-submit="save">
        <.input field={@form[:email]} label="Email" name="email" value={@form[:email]}/>
        <.input field={@form[:username]} label="Username" name="username" value={@form[:email]} />
        <:actions>
          <.button>Save</.button>
        </:actions>
      </.simple_form>
    """
  end

  def handle_event("validate", %{"email" => email, "username" => username}, socket) do
    form = socket.assigns[:form]

    dbg(form)
    {:noreply, assign(socket, socket.assigns[:form][:email], email)}
  end

  # update socket state when receive message of new price
#  def handle_info({:new_price, companies}, socket) do
#    {:noreply, assign(socket, companies: companies)}
#  end
end
