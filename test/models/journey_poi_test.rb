require 'test_helper'

class JourneyPOITest < ActiveSupport::TestCase

 i_suck_and_my_tests_are_order_dependent!

  def setup
    @jp= journey_pois(:jpone)
  end
  test '01 valid journey poi' do
    #p @jp
    assert @jp.valid?
  end

  test '02 invalid journey poi without name' do
    @jp.name = nil
    refute @jp.valid?
  end

  test '03 invalid journey poi without poi' do
    @jp.poi = nil
    refute @jp.valid?
  end

  test '04 invalid journey poi without journey' do
    @jp.journey = nil
    refute @jp.valid?
  end

  # test 'invalid poi without longitude & latitude' do
  #   @poi.latitude = nil
  #   @poi.longitude = nil
  #   refute @poi.valid?
  # end

end
