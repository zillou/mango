defmodule Mango.Catalog do
  alias Mango.Catalog.Product

  def list_products do
    [
      %Product{name: "Tomato", price: 50, is_sasonal: false, category: "vegetables" },
      %Product{name: "Apple", price: 100, is_sasonal: true, category: "fruits"},
    ]
  end

  def list_seasonal_products do
    list_products()
    |> Enum.filter(&(&1.is_sasonal == true))
  end

  def get_category_products(name) do
    list_products()
    |> Enum.filter(&(&1.category == name))
  end
end
