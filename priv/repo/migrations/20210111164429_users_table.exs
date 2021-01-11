defmodule Scoringsystem.Repo.Migrations.UsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :name, :string
      add :rating, :integer
      add :status, UserStatusEnum.type()
      add :user_type, UserTypeEnum.type()

      timestamps
    end
  end
end
