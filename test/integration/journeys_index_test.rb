require 'test_helper'

class JourneysIndexTest < ActionDispatch::IntegrationTest
  test "journeys loads correctly" do
    visit "/journeys"
    #save_and_open_screenshot
    assert_equal 200, page.status_code
 end

end
