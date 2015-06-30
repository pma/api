defmodule Api.ErrorView do

  def render("404.json", _assigns) do
    %{error: %{code: 404, message: "Page not found"}}
  end

  def render("500.json", _assigns) do
    %{error: %{code: 500, message: "Server internal error"}}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end
end
