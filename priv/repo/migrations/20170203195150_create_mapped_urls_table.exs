defmodule Urito.Repo.Migrations.CreateMappedUrlsTable do
  use Ecto.Migration

  def change do
    create table(:mapped_urls) do
      add :slug,    :string, null: false
      add :source,  :text, null: false

      timestamps()
    end

    index(:mapped_urls, [:slug], unique: true)
  end
end
