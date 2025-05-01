require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_index_url
    assert_response :success
  end

  test "should get mark_as_shipped" do
    get admin_orders_mark_as_shipped_url
    assert_response :success
  end
end
