defmodule Urito.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Urito.Endpoint
      import Urito.Router.Helpers

      Application.put_env(:wallaby, :base_url, Urito.Endpoint.url)
    end
  end

   setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Urito.Repo)
    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Urito.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Urito.Repo, {:shared, self()})
    end

    {:ok, session: session}
  end
end
