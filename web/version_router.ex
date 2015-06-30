defmodule Api.VersionRouter do

  def init(opts), do: opts

  def call(conn, opts) do
    case api_version(conn) do
      "v1" -> Api.V1.Router.call(conn, Api.V1.Router.init(opts))
    end
  end

  def api_version(conn) do
    "v1"
  end
end
