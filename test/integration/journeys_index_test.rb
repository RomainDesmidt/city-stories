require 'test_helper'

class IntegrationJourneysIndexTest < ActionDispatch::IntegrationTest
  def setup
    @journeys= journey_pois(:jpone)
    @poi = pois(:poione)
  end

  test "journeys index loads correctly and put a marker on the map" do
    Capybara.current_driver = :selenium
    visit "/journeys"
    refute page.evaluate_script("all_markers[0].title").nil?
    #binding.pry
    #assert (response_code == '200'), "Response code should be 200 : got #{response_code}"
    #save_and_open_page
    #save_and_open_screenshot
    # p @journeys
    #p page.status_code
    #assert_equal 200, page.status_code
 end
end
