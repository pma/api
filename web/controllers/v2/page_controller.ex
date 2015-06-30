defmodule Api.V2.PageController do
  use Api.V2.Web, :controller

  def index(conn, _params) do
    render conn, :index, pages: ["v2"]
  end
end
