ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(Urito.Repo, :manual)

{:ok, _} = Application.ensure_all_started(:wallaby)
