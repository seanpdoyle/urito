defmodule Urito.Request do
  alias Urito.MappedUrl
  use Urito.Web, :model

  schema "requests" do
    belongs_to :mapped_url, MappedUrl

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:mapped_url_id])
    |> validate_required([:mapped_url_id])
  end

  def changeset_for_tracking(mapped_url) do
    %__MODULE__{
      mapped_url_id: mapped_url.id,
    }
  end
end
