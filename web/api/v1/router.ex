defmodule Api.V1.Router do
  use Api.Web, :router

  scope "/", Api do
    get "/", PageController, :index
  end

end
