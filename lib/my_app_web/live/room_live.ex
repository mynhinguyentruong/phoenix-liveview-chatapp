defmodule MyAppWeb.RoomLive do
  use MyAppWeb, :live_view

  def mount(%{"id" => room_id}, _, socket) do
    form = %{
    "username" => "Nhi",
    "email" => "asdasd@asds.com",
    "input_value" => "sadasdsa",
    "name" => "ASdasd"
    }
    topic = "room:" <> room_id
    MyAppWeb.Endpoint.subscribe(topic)
    {:ok, assign(socket, room_id: room_id, form: form, input_value: [%{email: "nhi.nguyen27@outlook.com", username: "nhi12"}], input: "", value: "", name: "", email: "", topic: topic)}
  end

  def handle_event("submit_message", params, socket) do
    dbg(params)
    {:noreply, socket}
#    current_input = socket.assigns.input_value
#    {:noreply, assign(socket, input_value: [input | current_input])}
  end

  def handle_event("input_change", %{"my_input" => input}, socket) do
    {:noreply, assign(socket, input: input)}
  end

  def handle_event("save", %{"email" => email, "username" => username}, socket) do
#    dbg(params)
#    [(my_app 0.1.0) lib/my_app_web/live/room_live.ex:26: MyAppWeb.RoomLive.handle_event/3]
#     params #=> %{"email" => "asdasd@Adasd", "username" => "asdadasdads"}
#  when name="email" and name="username" in inputs
    tail = socket.assigns.input_value
    input_value =  [%{email: email, username: username} | tail]
    dbg(input_value)
    MyAppWeb.Endpoint.broadcast(socket.assigns.topic, "new-message", input_value: input_value, )

    {:noreply, assign(socket, name: username, email: email, input_value: input_value)}
  end

  def handle_info(%{event: "new-message", payload: input_value}, socket) do
    {:noreply, assign(socket, input_value)}
  end

  def handle_event("form-change", params, socket) do
    dbg(params)
    {:noreply, socket}
  end

  def render_list(_list) do

  end

  def render(assigns) do
    ~H"""

    <%= for item <- @input_value do %>
    <div id="comments-container" >
      <h2><%= item.username %></h2>
      <p><%= item.email %></p>
    </div>
    <% end %>

    <.form for={@form} phx-change="validate" phx-submit="save" >
    <.input name="username" value={@form[:username]} type="text" field={@form[:username]} phx-change="form-change"/>
    <.input name="email" value={@form[:email]} type="email" field={@form[:email]} phx-change="form-change"/>
    <button>Save</button>
    </.form>
    """
  end


end
