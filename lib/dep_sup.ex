defmodule DepSup do
  @moduledoc """
  Dependency Supervisor helps to manage runtime, dynamic dependencies - usually process(es).

  - Runtime means the process(es) get started or re-started while the application is running, so users of `DepSup` need to make sure they expect these processes might not exist.
  - Dynamic means they don't need to be configured statically, and users can specify what behaviour they want for different configs, e.g. only a single dep process, replace old one with new configs; creata a new process for every different config (diff determined by `erlang:phash2`); always create new processes...
  """

  @spec try_start(Supervisor.child_spec() | {module(), term()} | module()) ::
          {:ok, pid()} | {:error, term()}
  def try_start(child_spec) do
    case DynamicSupervisor.start_child(DepSup.DepSupervisor, child_spec) do
      {:ok, pid} -> {:ok, pid}
      {:ok, pid, _info} -> {:ok, pid}
      :ignore -> {:error, :ignore}
      {:error, {:already_started, pid}} -> {:ok, pid}
      {:error, other} -> {:error, other}
    end
  end
end
