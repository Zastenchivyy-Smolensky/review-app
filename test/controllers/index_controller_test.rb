require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get index_top_url
    assert_response :success
    assert_select "title","home"
  end
  test "should get about" do
    get index_about_url
    assert_response :success
    assert_select "title","About | home"
  end
  test "should get help" do
    get index_help_url
    assert_response :success
    assert_select "title","Help | home"
  end
end
