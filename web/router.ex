defmodule Api.Router do
  import Plug.Conn, only: [get_req_header: 2]
  import Plug.MIME, only: [type: 1]

  @vendor "acme"
  @regex ~r/application\/vnd\.([^\.]+)\.(v[\d]+)\+([a-z]+)/
  @versions ~w(v1 v2)
  @default List.last(@versions)

  def init(opts), do: opts

  def call(conn, opts) do
    {conn, version} = extract_version(conn)

    case version do
      "v1" -> Api.V1.Router.call(conn, Api.V1.Router.init(opts))
      "v2" -> Api.V2.Router.call(conn, Api.V2.Router.init(opts))
    end
  end

  def extract_version(conn) do
    case get_req_header(conn, "accept") do
      [accept_header] ->
        case Regex.scan(@regex, accept_header) do
          [[version_type, @vendor, version, base_type] | _] when version in @versions ->
            {convert_media_type(conn, accept_header, version_type, base_type), version}
          _ ->
            {conn, @default}
        end
      _ ->
        {conn, @default}
    end
  end

  defp convert_media_type(conn, accept_header, media_type, base_type) do
    conn
    |> Map.update!(:req_headers, fn req_headers ->
      req_headers
      |> List.keyreplace("accept", 0, {"accept", type(base_type) <> ";" <> accept_header})
    end)
  end

end
