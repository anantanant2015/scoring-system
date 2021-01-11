defmodule ScoringsystemWeb.Scoringsystem.UserController do
  use ScoringsystemWeb, :controller

  alias Scoringsystem.ScoringsystemCore
  alias Scoringsystem.ScoringsystemCore.User
  alias ScoringsystemWeb.Router.Helpers

  action_fallback ScoringsystemWeb.FallbackController

  def index(conn, _params) do
    users = ScoringsystemCore.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- ScoringsystemCore.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Helpers.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"uuid" => id}) do
    user = ScoringsystemCore.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"uuid" => id, "user" => user_params}) do
    user = ScoringsystemCore.get_user!(id)

    with {:ok, %User{} = user} <- ScoringsystemCore.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"uuid" => id}) do
    user = ScoringsystemCore.get_user!(id)

    with {:ok, %User{}} <- ScoringsystemCore.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
