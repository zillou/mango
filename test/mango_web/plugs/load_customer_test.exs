defmodule MangoWeb.Plugs.LoadCustomerTest do
  use MangoWeb.ConnCase

  alias Mango.CRM

  @valid_attrs %{
    "name" => "John",
    "email" => "john@example.com",
    "password" => "secret1",
    "residence_area" => "Area 1",
    "phone" => "67891234"
  }

  test "fetch customer from session on subsequent visit" do
    {:ok, customer} = CRM.create_customer(@valid_attrs)

    conn = post build_conn(), "/login", %{"session" => @valid_attrs}
    conn = get conn, "/"

    assert customer.id == conn.assigns.current_customer.id
  end
end
