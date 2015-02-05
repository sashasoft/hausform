require 'test_helper'

class ElementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
