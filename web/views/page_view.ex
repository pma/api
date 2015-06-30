defmodule Api.PageView do
  use Api.Web, :view

  def render("index.json", %{pages: pages}) do
    %{pages: pages}
  end
end
