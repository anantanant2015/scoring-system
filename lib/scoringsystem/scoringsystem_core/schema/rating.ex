defmodule Scoringsystem.ScoringsystemCore.Rating do
  use Scoringsystem.Schema
  import Ecto.Changeset

  @required [:type_uuid, :rating, :rating_type]

  schema "ratings" do
    field :type_uuid, :binary_id
    field :rating, :integer
    field :rating_type, RatingTypeEnum.type()

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_rating_provider_type(attrs)
  end

  defp validate_rating_type(rating, %{"rating_type" => "user"} = _attrs) do
    rating
  end

  defp validate_rating_type(rating, %{"rating_type" => "instrument"} = _attrs) do
    rating
  end

  defp validate_rating_type(rating, _attrs) do
    rating
    |> add_error(:rating_type, "Invalid!")
  end

  defp validate_rating_provider_type(rating, %{"rating_provider_type" => "trader"} = _attrs) do
    rating
  end

  defp validate_rating_provider_type(rating, _attrs) do
    rating
    |> add_error(:rating_provider_type, "Invalid!")
  end
end
