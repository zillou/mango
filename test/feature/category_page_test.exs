defmodule MangoWeb.Feature.CategoryPageTest do
  use MangoWeb.FeatureCase, async: true
  import Wallaby.Query, only: [css: 2]

  alias Mango.Repo
  alias Mango.Catalog.Product

  setup do
    Repo.insert %Product{ name: "Tomato", price: 55, sku: "A123", is_sasonal: false, category: "vegetables"}
    Repo.insert %Product{ name: "Apple", price: 100, sku: "B232", is_sasonal: true, category: "fruits"}
    :ok
  end

  test "show fruits", %{session: session} do
    session
    |> visit("/categories/fruits")
    |> assert_has(css(".page-title", text: "Fruits"))
    |> assert_has(css(".product-name", text: "Apple"))
    |> assert_has(css(".product-price", text: "100"))
    |> refute_has(css(".product-name", text: "Tomato"))
  end

  test "show vegetables", %{session: session} do
    session
    |> visit("/categories/vegetables")
    |> assert_has(css(".page-title", text: "Vegetables"))
    |> assert_has(css(".product-name", text: "Tomato"))
    |> assert_has(css(".product-price", text: "55"))
    |> refute_has(css(".product-name", text: "Apple"))
  end
end
