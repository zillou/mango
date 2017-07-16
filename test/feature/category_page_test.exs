defmodule MangoWeb.Feature.CategoryPageTest do
  use MangoWeb.FeatureCase, async: true
  import Wallaby.Query, only: [css: 2]

  test "show fruits", %{session: session} do
    session
    |> visit("/categories/fruits")
    |> assert_has(css(".page-title", text: "Fruits"))
    |> assert_has(css(".product-name", text: "Apple"))
    |> assert_has(css(".product-price", text: "100"))
    |> refute_has(css(".product-name", text: "Tomato"))
  end

  # test "show vegetables", %{session: session} do
  # end
end
