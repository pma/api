defmodule Api.V2.PageView do
  use Api.V2.Web, :view

  def render("index.json", %{pages: pages}) do
    %{pages: pages}
  end
end
