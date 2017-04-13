require 'test_helper'

class UnitTestJourneyTest < ActiveSupport::TestCase
   i_suck_and_my_tests_are_order_dependent!
  def setup
    @journey = journeys(:one)
  end
  test '01 valid journey' do
    #p @journey
    assert @journey.valid?
  end

  test '02 invalid journey without name' do
    @journey.name = nil
    refute @journey.valid?
  end

  test '03 invalid journey without description' do
    @journey.description = nil
    refute @journey.valid?
  end

  test '04 invalid journey without user' do
    @journey.user = nil
    refute @journey.valid?
  end
end
