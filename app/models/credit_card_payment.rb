class CreditCardPayment < ActiveRecord::Base
  belongs_to :buyers, optional: true
  belongs_to :client, optional: true
  has_one :card

  validates :amount, presence: true
  validates :client_id, presence: true
end
