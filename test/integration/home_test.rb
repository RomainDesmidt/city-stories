require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
 test "home loads correctly" do
    visit "/"
    #save_and_open_screenshot
    assert_equal 200, page.status_code
 end
end
