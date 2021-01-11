defmodule ScoringsystemWeb.Router do
  use ScoringsystemWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ScoringsystemWeb do
    pipe_through :api

    resources "/users", Scoringsystem.UserController
    resources "/ratings", Scoringsystem.RatingController
    resources "/instruments", Scoringsystem.InstrumentController
  end
end
