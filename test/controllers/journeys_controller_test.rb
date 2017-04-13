require 'test_helper'

class UnitTestJourneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journeys = journey_pois(:jpone)
  end

## JOURNEYS INDEX
  test "should get index" do
    get journeys_url
    assert_response :success
  end

  test "should find hidden content" do
    get journeys_url
    assert_select 'div.hidden-content', 2
    #p @journeys
  end
## JOURNEYS INDEX END

end
