defmodule ScoringsystemWeb.Scoringsystem.UserView do
  use ScoringsystemWeb, :view
  alias ScoringsystemWeb.Scoringsystem.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.uuid}
  end
end
