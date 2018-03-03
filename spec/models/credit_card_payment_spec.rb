require 'rails_helper'

RSpec.describe CreditCardPayment, type: :model do
  let(:client) { Client.new }
  let(:buyer) { Buyer.create(name: "Peter Paker", cpf: "124684688", email: "spider@bol.com")  }
  let(:payment) { Payment.create(payment_hash: "PAY-123", status: 1, amount: 1200, buyer_id: buyer.id, client_id: client.id )  }
  let(:card) { Card.create(holder_name: "AAA", number: "1234123412341234", expiration_date: Date.parse("2016-02-02"), buyer_id: buyer.id)  }
  subject { described_class.create(card_id: card.id, payment_id: payment.id)  }

  it "is valid with valid parameters" do
    expect(subject).to be_valid
  end
end
