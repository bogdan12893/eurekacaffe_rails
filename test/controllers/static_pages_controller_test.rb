require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get blog" do
    get blog_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end

  test "should get service" do
    get service_path
    assert_response :success
  end
end
