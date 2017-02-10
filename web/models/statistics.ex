defmodule Urito.Statistics do
  defstruct slug: "", views: 0

  def build(mapped_url) do
    %__MODULE__{
      slug: mapped_url.slug,
      views: Enum.count(mapped_url.requests),
    }
  end
end
