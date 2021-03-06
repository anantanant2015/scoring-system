defmodule ScoringsystemWeb.Scoringsystem.RatingView do
  use ScoringsystemWeb, :view
  alias ScoringsystemWeb.Scoringsystem.RatingView

  def render("index.json", %{ratings: ratings}) do
    %{data: render_many(ratings, RatingView, "rating.json")}
  end

  def render("show.json", %{rating: rating}) do
    %{data: render_one(rating, RatingView, "rating.json")}
  end

  def render("rating.json", %{rating: rating}) do
    %{
      id: rating.uuid,
      type_uuid: rating.type_uuid,
      rating: rating.rating,
      rating_type: rating.rating_type
    }
  end
end
