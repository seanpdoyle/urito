defmodule Urito.Repo.Migrations.CreateStatistics do
  use Ecto.Migration

  def up do
    execute """
    CREATE OR REPLACE VIEW statistics AS (
      SELECT
        mapped_url_id,
        date_trunc('month', inserted_at) AS month,
        COUNT(*) AS requests_count
      FROM requests
      GROUP BY
        mapped_url_id,
        date_trunc('month', inserted_at)
      ORDER BY
        month DESC
    );
    """
  end

  def down do
    execute """
    DROP VIEW statistics;
    """
  end
end
