defmodule Urito.Statistics do
  use Urito.Web, :model

  @primary_key false
  schema "statistics" do
    belongs_to :mapped_url, MappedUrl
    field :month, :utc_datetime
    field :requests_count, :integer
  end
end
