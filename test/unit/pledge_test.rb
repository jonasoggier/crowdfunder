require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  
  setup do
    @p = FactoryGirl.create(:pledge)
    assert @p.valid?
  end

  test "field must not be empty" do
    @p.amount = ""
    refute @p.valid?
  end

  test "input must be an integer" do 
    @p.amount = "not_an_integer"
    refute @p.valid?
    @p.amount = 166.5
    refute @p.valid?
  end

  test "integer is accepted" do 
    @p.amount = 666
    assert @p.valid?
  end
end
