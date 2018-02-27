require 'test_helper'
require_relative '../fakes/buyer_fake'

class BuyerTest < ActiveSupport::TestCase

  def setup
    @buyer = BuyerFake.create
  end

  test "buyer should be valid" do
    assert @buyer.valid?
  end

  test "name should be present" do
    @buyer.name = " "
    assert_not @buyer.valid?
  end

  test "email should be present" do
    @buyer.email = " "
    assert_not @buyer.valid?
  end

  test "cpf should be present" do
    @buyer.cpf = " "
    assert_not @buyer.valid?
  end

  test "email should have email format" do
    invalid_addresses = %w[user@example,com user_at_ee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @buyer.email = ia
      assert_not @buyer.valid? '#{ia.inspect} should be invalid'
    end
  end

    test "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_ee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
      invalid_addresses.each do |ia|
        @buyer.email = ia
        assert_not @buyer.valid? '#{ia.inspect} should be invalid'
      end
    end
end
