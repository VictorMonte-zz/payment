require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:buyer) { Buyer.create(name: "goku", cpf: "12345789", email: "kakaroto@balls.com")  }
  subject {
    described_class.new(
      holder_name: "Son Goku", 
      number: "1234123412341234", 
      expiration_date: Date.parse("2019-02-02") ,
      cvv: 461,
      buyer_id: buyer.id)
  }

  it "is valid with valid parameters" do
    expect(subject).to be_valid 
  end

  it "is not valid with invalid holder name" do
    subject.holder_name = " "
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid number" do
    subject.number = " "
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid expiration date" do
    subject.expiration_date = " "
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid cvv" do
    subject.cvv = " "
    expect(subject).to_not be_valid
  end

  it "is valid with 16 characters in number" do
    subject.number = "1234123412341234"
    expect(subject).to be_valid
  end

  it "is not valid less than 16 characters in number" do
    subject.number = "1234"
    expect(subject).to_not be_valid
  end

  it "is not valid more than 16 characters in number" do
    subject.number = "1234" * 15
    expect(subject).to_not be_valid
  end

end
