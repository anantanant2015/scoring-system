defmodule Scoringsystem.ScoringsystemCore.Instrument do
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
  def changeset(instrument, attrs) do
    instrument
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_instrument_type(attrs)
    |> validate_number(:rating, greater_than: -1)
    |> validate_number(:rating, less_than: 101)
  end

  defp validate_instrument_type(instrument, %{"instrument_type" => "physical_commodity"} = _attrs) do
    instrument
  end

  defp validate_instrument_type(instrument, %{"instrument_type" => "company"} = _attrs) do
    instrument
  end

  defp validate_instrument_type(instrument, %{"instrument_type" => "comment"} = _attrs) do
    instrument
  end

  defp validate_instrument_type(instrument, _attrs) do
    instrument
    |> add_error(:instrument_type, "Invalid!")
  end
end
