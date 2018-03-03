class BoletoPayment < ActiveRecord::Base
  belongs_to :payment

  validates :boleto_number, presence: true
end
