defmodule Scoringsystem.ScoringsystemCore.User do
  use Scoringsystem.Schema
  import Ecto.Changeset

  @required [:name, :user_type]
  @optional [:rating, :status]

  schema "users" do
    field :name, :string
    field :rating, :integer
    field :status, UserStatusEnum.type()
    field :user_type, UserTypeEnum.type()

    timestamps()
  end

  @doc false
  def create_changeset(user, attrs) do
    user
    |> common_changeset(attrs)
    |> validate_default_rating(attrs)
  end

  def update_changeset(user, attrs) do
    user
    |> common_changeset(attrs)
    |> validate_status(attrs)
  end

  defp common_changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_number(:rating, greater_than: -1)
    |> validate_number(:rating, less_than: 101)
  end

  defp validate_status(
         user,
         %{"user_type" => "researcher", "rating_count" => rating_count} = _attrs
       ) do
    case rating_count >= 15 do
      true ->
        user
        |> put_change(:status, "verified")

      false ->
        user
        |> put_change(:status, "not_verified")
    end
  end

  defp validate_status(user, %{"user_type" => "trader", "rating_count" => _rating_count} = _attrs) do
    user
    |> put_change(:status, "not_applicable")
  end

  defp validate_default_rating(user, %{"user_type" => "trader"} = _attrs) do
    user
    |> delete_change(:rating)
  end

  defp validate_default_rating(user, %{"user_type" => "researcher"} = _attrs) do
    user
    |> delete_change(:rating)
    |> put_change(:rating, 90)
  end

  defp validate_default_rating(user, _attrs) do
    user
    |> add_error(:user_type, "Invalid!")
  end
end
