require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get acerca_de" do
    get :acerca_de
    assert_response :success
  end

end
