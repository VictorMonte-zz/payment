class BoletoPayment < ActiveRecord::Base
  belongs_to :buyer, optional: true 
  belongs_to :client, optional: true

  validates :amount, presence: true
  validates :boleto_number, presence: true
  validates :client_id, presence: true
end
