defmodule ScoringsystemWeb.Scoringsystem.InstrumentControllerTest do
  use ScoringsystemWeb.ConnCase

  alias Scoringsystem.ScoringsystemCore
  alias Scoringsystem.ScoringsystemCore.Instrument
  alias ScoringsystemWeb.Router.Helpers

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:instrument) do
    {:ok, instrument} = ScoringsystemCore.create_instrument(@create_attrs)
    instrument
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all instruments", %{conn: conn} do
      conn = get(conn, Helpers.instrument_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create instrument" do
    test "renders instrument when data is valid", %{conn: conn} do
      conn = post(conn, Helpers.instrument_path(conn, :create), instrument: @create_attrs)
      assert %{"uuid" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Helpers.instrument_path(conn, :show, id))

      assert %{
               "uuid" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Helpers.instrument_path(conn, :create), instrument: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update instrument" do
    setup [:create_instrument]

    test "renders instrument when data is valid", %{
      conn: conn,
      instrument: %Instrument{uuid: id} = instrument
    } do
      conn =
        put(conn, Helpers.instrument_path(conn, :update, instrument), instrument: @update_attrs)

      assert %{"uuid" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Helpers.instrument_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, instrument: instrument} do
      conn =
        put(conn, Helpers.instrument_path(conn, :update, instrument), instrument: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete instrument" do
    setup [:create_instrument]

    test "deletes chosen instrument", %{conn: conn, instrument: instrument} do
      conn = delete(conn, Helpers.instrument_path(conn, :delete, instrument))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Helpers.instrument_path(conn, :show, instrument))
      end
    end
  end

  defp create_instrument(_) do
    instrument = fixture(:instrument)
    {:ok, instrument: instrument}
  end
end
