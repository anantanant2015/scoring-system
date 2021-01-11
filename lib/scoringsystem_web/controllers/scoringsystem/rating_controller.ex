defmodule ScoringsystemWeb.Scoringsystem.RatingController do
  use ScoringsystemWeb, :controller

  alias Scoringsystem.ScoringsystemCore
  alias Scoringsystem.ScoringsystemCore.Rating
  alias ScoringsystemWeb.Router.Helpers

  action_fallback ScoringsystemWeb.FallbackController

  def index(conn, _params) do
    ratings = ScoringsystemCore.list_ratings()
    render(conn, "index.json", ratings: ratings)
  end

  def create(conn, %{"rating" => rating_params}) do
    with {:ok, %Rating{} = rating} <- ScoringsystemCore.create_rating(rating_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Helpers.rating_path(conn, :show, rating))
      |> render("show.json", rating: rating)
    end
  end

  def show(conn, %{"uuid" => id}) do
    rating = ScoringsystemCore.get_rating!(id)
    render(conn, "show.json", rating: rating)
  end

  def update(conn, %{"uuid" => id, "rating" => rating_params}) do
    rating = ScoringsystemCore.get_rating!(id)

    with {:ok, %Rating{} = rating} <- ScoringsystemCore.update_rating(rating, rating_params) do
      render(conn, "show.json", rating: rating)
    end
  end

  def delete(conn, %{"uuid" => id}) do
    rating = ScoringsystemCore.get_rating!(id)

    with {:ok, %Rating{}} <- ScoringsystemCore.delete_rating(rating) do
      send_resp(conn, :no_content, "")
    end
  end
end
