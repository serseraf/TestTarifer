require 'test_helper'

class APisControllerTest < ActionController::TestCase
  test "should get list_catalog" do
    get :list_catalog
    assert_response :success
  end

  test "should get list_product" do
    get :list_product
    assert_response :success
  end

end
