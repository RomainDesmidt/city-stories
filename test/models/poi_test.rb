require 'test_helper'

class UnitTestPOITest < ActiveSupport::TestCase
   i_suck_and_my_tests_are_order_dependent!
  def setup
    @poi= pois(:poione)
  end
  test '01 valid poi' do
    assert @poi.valid?
  end

  test '02 invalid poi without latitude' do
    @poi.latitude = nil
    refute @poi.valid?
  end

  test '03 invalid poi without longitude' do
    @poi.latitude = nil
    refute @poi.valid?
  end

  test '04 invalid poi without longitude & latitude' do
    @poi.latitude = nil
    @poi.longitude = nil
    refute @poi.valid?
  end

end
