# ExTealFroala

Froala WYSIWYG Editor for Teal

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_teal_froala` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_teal_froala, "~> 0.1.0"}
  ]
end
```

Add your froala license as a config value:

```elixir
# config/runtime.exs

config :ex_teal_froala, license_key: System.get_env("FROALA_LICENSE_KEY")
```

Add it to your applications Teal Manifest:

```elixir
defmodule YourWebApp.ExTeal.Manifest do

  def plugins, do: [
    ExTealFroala.Plugin.new(%{})
  ]
end
```

With all of this done, you can start using the field!

## Usage

In any resource, you can add the froala text field to represent a text string with rich text:

```elixir
defmodule YourWebApp.ExTeal.BlogResource do
  use ExTeal.Resource

  def fields, do: [
    ExTeal.Fields.Text.make(:title),
    ExTealFroala.FroalaText.make(:body)
  ]
```

If you've configured a plugin that provides asset uploading functionality, you can integrate your
froala fields with it:

```elixir
alias ExTealFroala.FroalaText

FroalaText.make(:body)
|> FroalaText.with_assets()
```

You can also override the default froala configuration by passing in a map to `with_config/2`:


```elixir
alias ExTealFroala.FroalaText

FroalaText.make(:body)
|> FroalaText.with_config(%{
  plugins: ['align'],
  toolbarButtons: [],
})
```

This plugin includes all plugins distributed with Froala.
