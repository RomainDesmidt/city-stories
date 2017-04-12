require 'test_helper'

class JourneysControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @journey = journeys(:one)
  # end

## JOURNEYS INDEX
  test "should get index" do
    get journeys_url
    assert_response :success
  end

  test "should find hidden content" do
    get journeys_url
    assert_select 'div.hidden-content', 2
  end
## JOURNEYS INDEX END

end
