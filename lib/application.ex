defmodule DepSup.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: DepSup.DepSupervisor}
    ]

    opts = [strategy: :one_for_one, name: DepSup.RootSupervisor]
    Supervisor.start_link(children, opts)
  end
end
