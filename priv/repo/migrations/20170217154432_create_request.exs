defmodule Urito.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :mapped_url_id, references(:mapped_urls, on_delete: :delete_all), null: false

      timestamps()
    end
    create index(:requests, [:mapped_url_id])
  end
end
