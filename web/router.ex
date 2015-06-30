defmodule Api.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :put_resp_content_type, Plug.MIME.type("json")
  end

  scope "/", Api do
    pipe_through :api
    forward "/", VersionRouter
  end
end
