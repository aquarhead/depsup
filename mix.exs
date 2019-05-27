defmodule DepSup.MixProject do
  use Mix.Project

  def project do
    [
      app: :depsup,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "DepSup",
      source_url: "https://github.com/aquarhead/depsup",
      docs: docs()
    ]
  end

  def application do
    [
      mod: {DepSup.Application, []}
    ]
  end

  defp deps() do
    [
      {:dialyxir, "~> 1.0.0-rc.6", only: :dev, runtime: false},
      {:ex_doc, "~> 0.20", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end
end
