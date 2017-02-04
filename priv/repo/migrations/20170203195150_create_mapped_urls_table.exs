defmodule Urito.Repo.Migrations.CreateMappedUrlsTable do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:mapped_urls) do
      add :slug,    :citext, null: false
      add :source,  :text, null: false

      timestamps()
    end

    create unique_index(:mapped_urls, [:slug])
  end
end
