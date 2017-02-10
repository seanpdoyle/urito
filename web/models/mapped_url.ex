defmodule Urito.MappedUrl do
  alias Urito.Repo
  use Urito.Web, :model

  schema "mapped_urls" do
    field :slug, :string
    field :source, :string

    timestamps()
  end

  def get_by_slug!(slug) do
    sanitized_slug = String.trim(slug)

    Repo.get_by!(__MODULE__, slug: sanitized_slug)
  end

  def changeset(model \\ %__MODULE__{}, params \\ %{}) do
    model
    |> cast(params, [:slug, :source])
    |> validate_required([:slug, :source])
    |> unique_constraint(:slug)
  end
end
