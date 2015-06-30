defmodule Api.V2.Router do
  use Api.V2.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :put_resp_content_type, Plug.MIME.type("json")
  end

  scope "/", Api.V2 do
    pipe_through :api
    get "/", PageController, :index
  end

end
