defmodule Mango.CRM do
  alias Mango.CRM.Customer
  alias Mango.Repo

  def build_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
  end

  def create_customer(attrs) do
    attrs
    |> build_customer()
    |> Repo.insert
  end

  def get_customer_by_credentials(email, password) do
    customer = Repo.get_by(Customer, email: email)

    cond do
      customer && Comeonin.Argon2.checkpw(password, customer.password_hash) ->
        customer
      true ->
        :error
    end
  end
end