defmodule CalorieEstimatorWeb.CalorieControllerTest do
  use CalorieEstimatorWeb.ConnCase

  @valid_ingredients %{"ingredients" => "chicken, rice, olive oil"}
  @invalid_ingredients %{"ingredients" => ""}

  test "POST /api/estimate returns 200 with valid input", %{conn: conn} do
    conn = post(conn, "/api/estimate", @valid_ingredients)
    assert json_response(conn, 200)["calories"]
  end

test "POST /api/estimate returns 400 with missing input", %{conn: conn} do
  conn = post(conn, "/api/estimate", @invalid_ingredients)
  assert json_response(conn, 400)["error"]
end
end




