defmodule Api.V1.PageView do
  use Api.V1.Web, :view

  def render("index.json", %{pages: pages}) do
    %{pages: pages}
  end
end
