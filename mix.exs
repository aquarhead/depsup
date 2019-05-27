defmodule DepSup.MixProject do
  use Mix.Project

  def project do
    [
      app: :depsup,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: [{:ex_doc, "~> 0.20", only: :dev, runtime: false}]
    ]
  end

  def application do
    []
  end
end
