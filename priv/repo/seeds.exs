# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mango.Repo.insert!(%Mango.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mango.Repo
alias Mango.Catalog.Product

setup do
  Repo.insert %Product{ name: "Tomato", price: 55, sku: "A123", is_sasonal: false, category: "vegetables"}
  Repo.insert %Product{ name: "Apple", price: 100, sku: "B232", is_sasonal: true, category: "fruits"}
  :ok
end
