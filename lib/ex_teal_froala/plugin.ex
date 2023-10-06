defmodule ExTealFroala.Plugin do
  @moduledoc """
  ExTeal Plugin configuration for ExTealFroala
  """
  use ExTeal.Plugin
  alias ExTeal.Asset.{Script, Style}

  def repo, do: nil

  def uri, do: "froala"

  def router, do: ExTealFroala.Router

  def scripts, do: [%Script{path: "main.js"}]

  def styles, do: [%Style{path: "main.css"}]

  def js_config,
    do: %{
      froala_key: Application.get_env(:ex_teal_froala, :froala_key)
    }
end
