class CreditCardPayment < ActiveRecord::Base
  has_one :card
  has_one :payment
end
