defmodule MangoWeb.SessionController do
  use MangoWeb, :controller

  alias Mango.CRM

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case CRM.get_customer_by_credentials(email, password) do
      :error ->
        conn
        |> put_flash(:error, "Invalid username/password")
        |> render("new.html")
      customer ->
        conn
        |> assign(:current_customer, customer)
        |> put_session(:customer_id, customer.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Login successful")
        |> redirect(to: page_path(conn, :index))
    end
  end

  def destroy(conn, _) do
    clear_session(conn)
    |> put_flash(:info, "You have been logged out")
    |> redirect(to: page_path(conn, :index))
  end
end
