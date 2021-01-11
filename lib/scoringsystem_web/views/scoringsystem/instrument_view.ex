defmodule ScoringsystemWeb.Scoringsystem.InstrumentView do
  use ScoringsystemWeb, :view
  alias ScoringsystemWeb.Scoringsystem.InstrumentView

  def render("index.json", %{instruments: instruments}) do
    %{data: render_many(instruments, InstrumentView, "instrument.json")}
  end

  def render("show.json", %{instrument: instrument}) do
    %{data: render_one(instrument, InstrumentView, "instrument.json")}
  end

  def render("instrument.json", %{instrument: instrument}) do
    %{id: instrument.uuid}
  end
end
