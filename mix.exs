defmodule ExTealFroala.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_teal_froala,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_teal, "~> 0.27"},
      {:plug, ">= 1.7.0 or >= 2.1.0"},
      {:jason, ">= 1.0.0"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end
