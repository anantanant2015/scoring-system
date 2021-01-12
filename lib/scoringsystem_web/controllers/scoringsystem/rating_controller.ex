defmodule ScoringsystemWeb.Scoringsystem.RatingController do
  use ScoringsystemWeb, :controller

  alias Scoringsystem.ScoringsystemCore
  alias Scoringsystem.ScoringsystemCore.Rating
  alias ScoringsystemWeb.Router.Helpers

  action_fallback ScoringsystemWeb.FallbackController

  def create(conn, rating_params) do
    %{"rating_provider" => rating_provider} = rating_params
    user = ScoringsystemCore.get_user!(rating_provider)
    updated_rating_params = rating_params |> Map.put("rating_provider_type", user.user_type)

    with {:ok, %Rating{} = rating} <- ScoringsystemCore.create_rating(updated_rating_params),
         instrument <- ScoringsystemCore.get_instrument_from_rating(rating),
         {:ok, _} <- ScoringsystemCore.update_instrument_from_rating(instrument, rating) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Helpers.rating_path(conn, :show, rating))
      |> render("show.json", rating: rating)
    end
  end
end
