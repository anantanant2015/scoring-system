defmodule ScoringsystemWeb.Router do
  use ScoringsystemWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ScoringsystemWeb do
    pipe_through :api

    resources "/users", Scoringsystem.UserController, except: [:edit, :new]
    resources "/ratings", Scoringsystem.RatingController, only: [:create]
    resources "/instruments", Scoringsystem.InstrumentController, except: [:edit, :new]
  end
end
