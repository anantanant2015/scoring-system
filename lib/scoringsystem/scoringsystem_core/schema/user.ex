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
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end
