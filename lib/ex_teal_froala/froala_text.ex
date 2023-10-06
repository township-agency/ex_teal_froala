defmodule ExTealFroala.FroalaText do
  @moduledoc """
  Rich Text Field that uses the Froala WYSIWYG Editor to edit html content.
  """

  use ExTeal.Field

  def component, do: "froala-field"

  def show_on_index, do: false

  def sanitize_as, do: :html5

  def as_html, do: true

  @doc """
  Enable asset embedding for this input field.  This assumes that you've
  configured a plugin that handles and exposes file uploading functionality
  to the vue app
  """
  def with_assets(field), do: %{field | options: Map.put(field.options, :with_assets, true)}

  @doc """
  Customize the config of the editor.

  See [Froal's documentation](https://froala.com/wysiwyg-editor/docs/concepts-land/) for more details.
  """
  def with_config(field, options),
    do: %{field | options: Map.put(field.options, :config, options)}
end
