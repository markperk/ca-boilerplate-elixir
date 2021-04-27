defmodule BoilerplateWeb.PageController do
  use BoilerplateWeb, :controller

  def index(conn, params) do
    variables = %{body_class: "iframe", is_web: Map.get(params, "is_web", "false") == "true"}

    variables =
      case conn.assigns[:error] do
        nil ->
          Map.merge(variables, %{error: nil})

        error ->
          Map.merge(variables, %{error: error})
      end

    render(conn, "index.html", variables)
  end
end
