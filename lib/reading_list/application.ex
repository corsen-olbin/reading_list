defmodule ReadingList.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ReadingList.Repo,
      # Start the Telemetry supervisor
      ReadingListWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ReadingList.PubSub},
      # Start the Endpoint (http/https)
      ReadingListWeb.Endpoint
      # Start a worker by calling: ReadingList.Worker.start_link(arg)
      # {ReadingList.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReadingList.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ReadingListWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
