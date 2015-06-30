defmodule Api.V1.PageController do
  use Api.V1.Web, :controller

  def index(conn, _params) do
    render conn, :index, pages: []
  end
end
