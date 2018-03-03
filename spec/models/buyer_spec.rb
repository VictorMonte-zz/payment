require 'rails_helper'

RSpec.describe Buyer, type: :model do
  subject {
    described_class.new(
      email: "bruce@gmail.com",
      name: "Bruce Wayne",
      cpf: "12345678945")
  }

  it "is valid with valid parameters" do
    expect(subject).to be_valid
  end

  it "is not valid without a email" do
    subject.email = " "
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = " "
    expect(subject).to_not be_valid

  end

  it "is not valid without a cpf" do
    subject.cpf = " "
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid email" do
    invalid_addresses = %w[user@example,com user_at_ee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      subject.email = ia
      expect(subject).to_not be_valid
    end
  end

  it "is valid with valid email" do
    valid_addresses = %w[user@example.com user1_12_123@aa.com aaaa_123@c.com.bvr]
    valid_addresses.each do |ia|
      subject.email = ia
      expect(subject).to be_valid
    end
  end

end
