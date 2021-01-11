defmodule ScoringsystemWeb.Router do
  use ScoringsystemWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ScoringsystemWeb do
    pipe_through :api
  end
end
