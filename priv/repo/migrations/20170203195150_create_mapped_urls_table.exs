defmodule Urito.Repo.Migrations.CreateMappedUrlsTable do
  use Ecto.Migration

  def change do
    create table(:mapped_urls) do
      add :slug,    :string
      add :source,  :text, null: false

      timestamps()
    end
  end
end
