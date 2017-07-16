defmodule Mango.CRMTest do
  use Mango.DataCase, async: true

  alias Mango.CRM
  alias Mango.CRM.Customer

  test "build_customer/0 returns a customer changeset" do
    assert %Ecto.Changeset{data: %Customer{}} = CRM.build_customer()
  end

  test "build_customer/1 returns a customer changeset" do
    attrs = %{"name" => "John"}
    changeset = CRM.build_customer(attrs)
    assert changeset.params() == attrs
  end

  test "create_customer/1 returns a customer for valid data" do
    valid_attrs = %{
      "name" => "John",
      "email" => "john@example.com",
      "password" => "secret",
      "residence_area" => "Area 1",
      "phone" => "56781234"
    }

    assert {:ok, customer} = CRM.create_customer(valid_attrs)
    assert Comeonin.Argon2.checkpw(valid_attrs["password"], customer.password_hash)
  end

  test "create_customer/1 returns a changeset for invalid data" do
    invalid_attrs = %{}
    assert {:error, %Ecto.Changeset{}} = CRM.create_customer(invalid_attrs)
  end

  test "get_customer_by_credentials/1" do
    {:ok, customer} = CRM.create_customer(%{
      "name" => "John",
      "email" => "john@example.com",
      "password" => "secret",
      "residence_area" => "Area 1",
      "phone" => "68161234"
    })

    customer2 = CRM.get_customer_by_credentials("john@example.com", "secret")

    assert customer.id == customer2.id
  end
end
