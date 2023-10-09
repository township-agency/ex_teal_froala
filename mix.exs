defmodule ExTealFroala.MixProject do
  use Mix.Project

  @source "https://github.com/township-agency/ex_teal_froala"

  def project do
    [
      app: :ex_teal_froala,
      version: "1.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExTealFroala",
      source: @source,
      package: package(),
      docs: docs(),
      description: "A Teal wrapper for the Froala WYSIWYG Editor"
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
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ~w(lib .formatter.exs mix.exs README* CHANGELOG* priv),
      maintainers: ["Scott Taylor", "Township Agency"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"],
      source_url: @source
    ]
  end
end
