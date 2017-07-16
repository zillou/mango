defmodule MangoWeb.Feature.HomepageTest do
  use MangoWeb.FeatureCase, async: true

  test "presence of featured products", %{session: session} do
    session
    |> visit("/")
    |> assert_has(Query.css("h1", text: "Seasonal products"))
  end
end
