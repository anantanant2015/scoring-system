defmodule Scoringsystem.Schema.Rating do
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
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
