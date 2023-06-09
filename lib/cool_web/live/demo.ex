defmodule CoolWeb.Demo do
  use Surface.LiveView

  alias CoolWeb.Components.Card

  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> allow_upload(:cool_pngs,
        accept: ~w(.png),
        max_entries: 2
      )
    }
  end

  def render(assigns) do
    ~F"""
    <style>
      .tag {
        @apply bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2;
      }
    </style>

    <div class="flex items-center justify-center h-screen">
      <Card max_width="lg" rounded>
        <:header>
          Surface UI
        </:header>

        Start building rich interactive user-interfaces, writing minimal custom Javascript.
        Built on top of Phoenix LiveView, <strong>Surface</strong> leverages the amazing
        <strong>Phoenix Framework</strong> to provide a fast and productive solution to
        build modern web applications.

        <:footer>
          <span class="tag">#surface</span>
          <span class="tag">#phoenix</span>
          <span class="tag">#tailwindcss</span>
        </:footer>
      </Card>
    </div>
    """
  end
end
