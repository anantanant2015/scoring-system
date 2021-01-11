defmodule Scoringsystem.Repo.Migrations.RatingsTable do
  use Ecto.Migration

  def change do
    create table(:ratings, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      # add :created_by, references(:users, type: :uuid, column: :uuid)
      add :type_uuid, :uuid
      add :rating, :integer
      add :rating_type, RatingTypeEnum.type()

      timestamps
    end
  end
end
