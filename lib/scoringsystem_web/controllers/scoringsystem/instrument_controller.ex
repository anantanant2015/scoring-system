defmodule ScoringsystemWeb.Scoringsystem.InstrumentController do
  use ScoringsystemWeb, :controller

  alias Scoringsystem.ScoringsystemCore
  alias Scoringsystem.ScoringsystemCore.Instrument
  alias ScoringsystemWeb.Router.Helpers

  action_fallback ScoringsystemWeb.FallbackController

  def index(conn, _params) do
    instruments = ScoringsystemCore.list_instruments()
    render(conn, "index.json", instruments: instruments)
  end

  def create(conn, %{"instrument" => instrument_params}) do
    with {:ok, %Instrument{} = instrument} <-
           ScoringsystemCore.create_instrument(instrument_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Helpers.instrument_path(conn, :show, instrument))
      |> render("show.json", instrument: instrument)
    end
  end

  def show(conn, %{"uuid" => id}) do
    instrument = ScoringsystemCore.get_instrument!(id)
    render(conn, "show.json", instrument: instrument)
  end

  def update(conn, %{"uuid" => id, "instrument" => instrument_params}) do
    instrument = ScoringsystemCore.get_instrument!(id)

    with {:ok, %Instrument{} = instrument} <-
           ScoringsystemCore.update_instrument(instrument, instrument_params) do
      render(conn, "show.json", instrument: instrument)
    end
  end

  def delete(conn, %{"uuid" => id}) do
    instrument = ScoringsystemCore.get_instrument!(id)

    with {:ok, %Instrument{}} <- ScoringsystemCore.delete_instrument(instrument) do
      send_resp(conn, :no_content, "")
    end
  end
end
