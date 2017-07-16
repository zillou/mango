defmodule MangoWeb.Feature.HomepageTest do
  use MangoWeb.FeatureCase, async: true

  import Wallaby.Query, only: [css: 2]

  test "presence of featured products", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".page-title", text: "Seasonal Products"))
    |> assert_has(css(".product-name", text: "Apple"))
    |> assert_has(css(".product-price", text: "100"))
  end
end
