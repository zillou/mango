defmodule Mango.Catalog do
  alias Mango.Repo
  alias Mango.Catalog.Product

  def list_products do
    Repo.all(Product)
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
