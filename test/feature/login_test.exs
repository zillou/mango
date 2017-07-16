defmodule MangoWeb.Feature.LoginTest do
  use MangoWeb.FeatureCase, async: true

  import Wallaby.Query

  setup do
    {:ok, _} = Mango.CRM.create_customer(%{
      "name" => "John",
      "email" => "john@example.com",
      "password" => "secret",
      "residence_area" => "Area 1",
      "phone" => "56781234"
    })

    :ok
  end

  test "successful login for valid credential", %{session: session} do
    session
    |> visit("/login")
    |> fill_in(text_field("Email"), with: "john@example.com")
    |> fill_in(text_field("Password"), with: "secret")
    |> click(button("Log in"))
    |> assert_has(css(".alert", text: "Login successful"))
  end
end
