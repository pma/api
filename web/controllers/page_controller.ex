defmodule Api.PageController do
  use Api.Web, :controller

  def index(conn, _params) do
    render conn, :index, pages: []
  end
end
