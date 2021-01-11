defmodule Scoringsystem.Schema.Instrument do
  use Scoringsystem.Schema
  import Ecto.Changeset

  @required [:description, :rating, :instrument_type]

  schema "instruments" do
    field :description, :string
    field :rating, :integer
    field :instrument_type, InstrumentTypeEnum.type()

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
