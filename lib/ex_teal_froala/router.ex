defmodule ExTealFroala.Router do
  @moduledoc """
  Routing for ExTealFroala
  """
  use Plug.Router

  alias Plug.Conn

  plug(Plug.Static,
    at: "/",
    from: {:ex_teal_froala, "priv/static"}
  )

  plug(Plug.Logger, log: :debug)

  plug(Plug.Parsers, parsers: [:urlencoded])
  plug(Plug.MethodOverride)

  plug(:match)
  plug(:dispatch)

  def init, do: []

  @doc false
  def call(conn, opts) do
    conn =
      conn
      |> extract_namespace(opts)
      |> Conn.put_private(:plug_skip_csrf_protection, true)

    super(conn, opts)
  end

  get "/" do
    send_resp(conn, 200, Jason.encode!(%{hello: "world"}))
  end

  defp extract_namespace(conn, opts) do
    ns = opts[:namespace] || "teal/plugins/#{ExTealFroala.Plugin.uri()}"
    Conn.assign(conn, :namespace, "/" <> ns)
  end
end
