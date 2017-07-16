defmodule Mango.CatalogTest do
  use Mango.DataCase, async: true

  alias Mango.Repo
  alias Mango.Catalog
  alias Mango.Catalog.Product

  setup do
    Repo.insert %Product{ name: "Tomato", price: 55, sku: "A123", is_sasonal: false, category: "vegetables"}
    Repo.insert %Product{ name: "Apple", price: 55, sku: "B232", is_sasonal: true, category: "fruits"}
    :ok
  end

  test "list_products/0 returns all products" do
    [p1, p2] = Catalog.list_products

    assert %Product{} = p1
    assert p1.name == "Tomato"
    assert %Product{} = p2
    assert p2.name == "Apple"
  end

  test "list_seasonal_products/0 returns all seasonal products" do
    [product = %Product{}]= Catalog.list_seasonal_products()
    assert product.name == "Apple"
  end

  test "get_category_products/1 returns products of given category" do
    [product = %Product{}] = Catalog.get_category_products("fruits")
    assert product.name == "Apple"
  end
end
