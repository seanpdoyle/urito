defmodule Urito.MappedUrl do
  use Urito.Web, :model

  schema "mapped_urls" do
    field :slug, :string
    field :source, :string

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params \\ %{}) do
    model
    |> cast(params, [:slug, :source])
    |> validate_required([:slug, :source])
    |> unique_constraint(:slug)
  end
end
