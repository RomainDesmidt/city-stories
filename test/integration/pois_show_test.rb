require 'test_helper'

class IntegrationPOISShowTest < ActionDispatch::IntegrationTest
  def setup
    @jp= journey_pois(:jpone)
  end

  test "poi show loads correctly with a google map and some content" do
    visit "/journeys/#{@jp.journey.id}/pois/#{@jp.poi.id}"
    #save_and_open_screenshot
    #save_and_open_page
    assert_equal 200, page.status_code
 end

end
