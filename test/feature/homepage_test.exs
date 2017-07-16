defmodule MangoWeb.Feature.HomepageTest do
  use MangoWeb.FeatureCase, async: true

  import Wallaby.Query, only: [css: 2]

  alias Mango.Repo
  alias Mango.Catalog.Product

  setup do
    Repo.insert %Product{ name: "Tomato", price: 55, sku: "A123", is_sasonal: false, category: "vegetables"}
    Repo.insert %Product{ name: "Apple", price: 100, sku: "B232", is_sasonal: true, category: "fruits"}
    :ok
  end

  test "presence of featured products", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".page-title", text: "Seasonal Products"))
    |> assert_has(css(".product-name", text: "Apple"))
    |> assert_has(css(".product-price", text: "100"))
  end
end
