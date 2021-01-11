defmodule Scoringsystem.ScoringsystemCoreTest do
  use Scoringsystem.DataCase

  alias Scoringsystem.ScoringsystemCore

  describe "users" do
    alias Scoringsystem.ScoringsystemCore.User

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ScoringsystemCore.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert ScoringsystemCore.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert ScoringsystemCore.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = ScoringsystemCore.create_user(@valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ScoringsystemCore.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = ScoringsystemCore.update_user(user, @update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = ScoringsystemCore.update_user(user, @invalid_attrs)
      assert user == ScoringsystemCore.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = ScoringsystemCore.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> ScoringsystemCore.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = ScoringsystemCore.change_user(user)
    end
  end

  describe "instruments" do
    alias Scoringsystem.ScoringsystemCore.Instrument

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def instrument_fixture(attrs \\ %{}) do
      {:ok, instrument} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ScoringsystemCore.create_instrument()

      instrument
    end

    test "list_instruments/0 returns all instruments" do
      instrument = instrument_fixture()
      assert ScoringsystemCore.list_instruments() == [instrument]
    end

    test "get_instrument!/1 returns the instrument with given id" do
      instrument = instrument_fixture()
      assert ScoringsystemCore.get_instrument!(instrument.id) == instrument
    end

    test "create_instrument/1 with valid data creates a instrument" do
      assert {:ok, %Instrument{} = instrument} = ScoringsystemCore.create_instrument(@valid_attrs)
    end

    test "create_instrument/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ScoringsystemCore.create_instrument(@invalid_attrs)
    end

    test "update_instrument/2 with valid data updates the instrument" do
      instrument = instrument_fixture()

      assert {:ok, %Instrument{} = instrument} =
               ScoringsystemCore.update_instrument(instrument, @update_attrs)
    end

    test "update_instrument/2 with invalid data returns error changeset" do
      instrument = instrument_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ScoringsystemCore.update_instrument(instrument, @invalid_attrs)

      assert instrument == ScoringsystemCore.get_instrument!(instrument.id)
    end

    test "delete_instrument/1 deletes the instrument" do
      instrument = instrument_fixture()
      assert {:ok, %Instrument{}} = ScoringsystemCore.delete_instrument(instrument)
      assert_raise Ecto.NoResultsError, fn -> ScoringsystemCore.get_instrument!(instrument.id) end
    end

    test "change_instrument/1 returns a instrument changeset" do
      instrument = instrument_fixture()
      assert %Ecto.Changeset{} = ScoringsystemCore.change_instrument(instrument)
    end
  end

  describe "ratings" do
    alias Scoringsystem.ScoringsystemCore.Rating

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def rating_fixture(attrs \\ %{}) do
      {:ok, rating} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ScoringsystemCore.create_rating()

      rating
    end

    test "list_ratings/0 returns all ratings" do
      rating = rating_fixture()
      assert ScoringsystemCore.list_ratings() == [rating]
    end

    test "get_rating!/1 returns the rating with given id" do
      rating = rating_fixture()
      assert ScoringsystemCore.get_rating!(rating.id) == rating
    end

    test "create_rating/1 with valid data creates a rating" do
      assert {:ok, %Rating{} = rating} = ScoringsystemCore.create_rating(@valid_attrs)
    end

    test "create_rating/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ScoringsystemCore.create_rating(@invalid_attrs)
    end

    test "update_rating/2 with valid data updates the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{} = rating} = ScoringsystemCore.update_rating(rating, @update_attrs)
    end

    test "update_rating/2 with invalid data returns error changeset" do
      rating = rating_fixture()
      assert {:error, %Ecto.Changeset{}} = ScoringsystemCore.update_rating(rating, @invalid_attrs)
      assert rating == ScoringsystemCore.get_rating!(rating.id)
    end

    test "delete_rating/1 deletes the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{}} = ScoringsystemCore.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> ScoringsystemCore.get_rating!(rating.id) end
    end

    test "change_rating/1 returns a rating changeset" do
      rating = rating_fixture()
      assert %Ecto.Changeset{} = ScoringsystemCore.change_rating(rating)
    end
  end
end
