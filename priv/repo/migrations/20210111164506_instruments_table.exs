defmodule Scoringsystem.Repo.Migrations.InstrumentsTable do
  use Ecto.Migration

  def change do
    create table(:instruments, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      # add :created_by, references(:users, type: :uuid, column: :uuid)
      add :description, :string
      add :rating, :integer
      add :instrument_type, InstrumentTypeEnum.type()

      timestamps
    end
  end
end
