require 'test_helper'

class UserTest < ActiveSupport::TestCase
   i_suck_and_my_tests_are_order_dependent!
  def setup
    @user = users(:valid)
  end
  test '01 valid user' do
    assert @user.valid?
  end

  test '02 invalid user without pseudo' do
    @user.pseudo = nil
    #p @user
    refute @user.valid?
  end

  test '03 invalid user without email' do
    @user.email = nil
    #p @user
    refute @user.valid?
  end
end
