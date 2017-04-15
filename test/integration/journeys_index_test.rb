require 'test_helper'

class IntegrationJourneysIndexTest < ActionDispatch::IntegrationTest
  def setup
    @journeys= journey_pois(:jpone)
    @poi = pois(:poione)
    @arr_journey = []
    @arr_journey << @journeys
  end

# could test on presence of error message that could be written in dom by js
# error to check => not as many marker as in db journey_poi
# error to ajax call
# error when clicking on profil face, should change content

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

  test "journeys POI all should be the same as all markers length" do
    Capybara.current_driver = :selenium
    visit "/journeys"
    assert (page.evaluate_script("Object.keys(all_markers).length") == @arr_journey.length), " all_markers.length = #{page.evaluate_script('Object.keys(all_markers).length')} should be equal to journey_pois.length got #{@arr_journey.length}"
  end


  test "var errorRaised should be default" do
    Capybara.current_driver = :selenium
    visit "/journeys"
    page.execute_script("all_markers[0].click()")
    assert (page.evaluate_script("errorRaised") == "No errors for now"), "an error has occured"
  end
end
