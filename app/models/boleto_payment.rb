class BoletoPayment < ActiveRecord::Base
  has_one :payment

  validates :boleto_number, presence: true
end
