class Payment < ActiveRecord::Base
  belongs_to :buyer, optional: true 
  belongs_to :client, optional: true
  
  has_one :boleto_payment
  has_one :credit_card_payment

  validates :amount, presence: true
  validates :client_id, presence: true
  validates :payment_hash, presence: true
end
