require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:buyer) { Buyer.create(name: "Rocky Balboa", cpf: "123846848", email: "rocky@balboa.com")  }
  let(:client) { Client.create  }
  subject { described_class.new(payment_hash: "PAYPOW", status: 1, amount: 6200, client_id: client.id, buyer_id: buyer.id)  }

  it "is valid with valid parameters" do
    expect(subject).to be_valid
  end

  it "is not valid without amount" do
    subject.amount = " "
    expect(subject).to_not be_valid
  end

  it "is not valid without payment hash" do
    subject.payment_hash = " "
    expect(subject).to_not be_valid
  end

end
