defmodule Urito.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :hashed_password, :string, null: false

      timestamps null: false
    end
  end
end
