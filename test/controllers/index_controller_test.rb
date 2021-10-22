require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get root_path
    assert_response :success
    assert_select "title","home"
  end
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title","About | home"
  end
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title","Help | home"
  end
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title","Contact | home"
  end
end
