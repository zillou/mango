defmodule MangoWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Mango.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import MangoWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Mango.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Mango.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Mango.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
