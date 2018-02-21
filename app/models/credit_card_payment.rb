class CreditCardPayment < ActiveRecord::Base
  belongs_to :buyers
  has_one :card
end
