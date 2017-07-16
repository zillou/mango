defmodule MangoWeb.Feature.RegistrationTest do
  use MangoWeb.FeatureCase, async: true

  import Wallaby.Query

  test "registers and account with valid data", %{session: session} do
    session
    |> visit("/register")
    |> fill_in(text_field("Name"), with: "John")
    |> fill_in(text_field("Email"), with: "john@example.com")
    |> fill_in(text_field("Phone"), with: "67891234")
    |> fill_in(text_field("Residence area"), with: "Hong Kong")
    |> fill_in(text_field("Password"), with: "secret")
    |> click(button("Register"))
    |> assert_has(css(".alert", text: "Registration successful"))
  end
end
