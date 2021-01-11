defmodule ScoringsystemWeb.Scoringsystem.RatingControllerTest do
  use ScoringsystemWeb.ConnCase

  alias Scoringsystem.ScoringsystemCore
  alias Scoringsystem.ScoringsystemCore.Rating
  alias ScoringsystemWeb.Router.Helpers

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:rating) do
    {:ok, rating} = ScoringsystemCore.create_rating(@create_attrs)
    rating
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ratings", %{conn: conn} do
      conn = get(conn, Helpers.rating_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rating" do
    test "renders rating when data is valid", %{conn: conn} do
      conn = post(conn, Helpers.rating_path(conn, :create), rating: @create_attrs)
      assert %{"uuid" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Helpers.rating_path(conn, :show, id))

      assert %{
               "uuid" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Helpers.rating_path(conn, :create), rating: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rating" do
    setup [:create_rating]

    test "renders rating when data is valid", %{conn: conn, rating: %Rating{uuid: id} = rating} do
      conn = put(conn, Helpers.rating_path(conn, :update, rating), rating: @update_attrs)
      assert %{"uuid" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Helpers.rating_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rating: rating} do
      conn = put(conn, Helpers.rating_path(conn, :update, rating), rating: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rating" do
    setup [:create_rating]

    test "deletes chosen rating", %{conn: conn, rating: rating} do
      conn = delete(conn, Helpers.rating_path(conn, :delete, rating))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Helpers.rating_path(conn, :show, rating))
      end
    end
  end

  defp create_rating(_) do
    rating = fixture(:rating)
    {:ok, rating: rating}
  end
end
