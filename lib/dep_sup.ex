defmodule DepSup do
  @moduledoc """
  Dependency Supervisor helps to manage runtime, dynamic dependencies - usually process(es).

  - Runtime means the process(es) get started or re-started while the application is running, so users of `DepSup` need to make sure they expect these processes might not exist.
  - Dynamic means they don't need to be configured statically, and users can specify what behaviour they want for different configs, e.g. only a single dep process, replace old one with new configs; creata a new process for every different config (diff determined by `erlang:phash2`); always create new processes...
  """
end
