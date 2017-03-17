defmodule Urito.Repo.Migrations.AddCreatorToMappedUrls do
  use Ecto.Migration

  def change do
    alter table(:mapped_urls) do
      add :creator_id, references(:users, on_delete: :delete_all, on_update: :update_all)
    end
  end
end
