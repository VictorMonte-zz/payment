require 'test_helper'
require_relative '../fakes/buyer_fake'

class CardTest < ActiveSupport::TestCase
  def setup
    @buyer = BuyerFake.create
    @card = @buyer.cards.create(
      holder_name: "aSAS", 
      number: "1234123412341234",
      expiration_date: Date.parse("2019-02-02"), 
      cvv: 123)
  end

  test "card must be valid" do
    puts @card.errors.full_messages
    assert @card.valid?
  end

  test "holder_number must be present" do
    @card.holder_name = " "
    assert_not @card.valid?
  end

  test "number must be present" do
    @card.number  = " "
    assert_not @card.valid?
  end

  test "expiration_date must be present" do
    @card.expiration_date  = " "
    assert_not @card.valid?
  end

  test "cvv must be present" do
    @card.cvv  = " "
    assert_not @card.valid?
  end
  
  test "card number must have 16 length" do
    @card.number = "1234123412341234"
    assert @card.valid?
  end

  test "card number should not have length different from 16" do
    @card.number = "4561234"
    assert_not @card.valid?
  end

  
end

