#defmodule MyAppWeb.GithubDeployView do
#  def render(assigns) do
#    ~H"""
#      <div>
#      <h1>Some Static Content</h1>
#      <p>Another Static Content</p>
#      <button phx-click="github_deploy">Deploy to Github</button>
#         <p> Status <%= my_var %> </p>
#      </div>
#    """
#  end
#
#  def mount(_, _, socket) do
#    {:ok, assign(socket, my_var: "Ready!")}
#  end
#
#  def handle_event("github_deploy", _, socket) do
#    :ok = Process.start_deploy()
#    send(self(), :create_org)
#    {:noreply, assign(socket, my_var: "Starting deploy...")}
#  end
#
#  def handle_info(:create_org, socket) do
#    {:ok, org} = MyAppWeb.create_org()
#    send(self(), {:create_repo, org})
#    {:noreply, assign(socket, my_var: "Creating Github org...")}
#  end
#
#  def handle_info({:create_repo, org}, socket) do
#    {:ok, repo} = MyAppWeb.create_repo(repo)
#    send(self(), {:push_contents, repo})
#    {:noreply, assign(socket, my_var: "Creating Github repo...")}
#  end
#
#  def handle_info({:push_contents, repo}, socket) do
#    :ok = MyAppWeb.push_contents(repo)
#    send(self(), :done)
#    {:noreply, assign(socket, my_var: "Pushing to repo...")}
#  end
#
#  def handle_info(:done, socket) do
#    {:noreply, assign(socket, my_var: "Done!")}
#  end
#end
