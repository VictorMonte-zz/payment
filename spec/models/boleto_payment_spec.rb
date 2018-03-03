require 'rails_helper'

RSpec.describe BoletoPayment, type: :model do
  let(:client) { Client.create }
  let(:buyer) { Buyer.create(name: "Gandalf", cpf: "1234589751", email: "gandalf@mordor.com")  }
  let(:payment) { Payment.create(payment_hash: "PAY-123", status: 1, amount: 1000, client_id: client.id, buyer_id: buyer.id)  }
  subject { described_class.create(boleto_number: "12345674546521", payment_id: payment.id) }

  it "is valid when valid parameters" do
    expect(subject).to be_valid
  end

  it "is invalid when boleto number invalid" do
    subject.boleto_number = " "
    expect(subject).to_not be_valid
  end

  it "has one payment" do
    assc = described_class.reflect_on_association(:payment)
    expect(assc.macro).to eq :belongs_to
  end
end
