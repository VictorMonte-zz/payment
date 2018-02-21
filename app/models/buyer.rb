class Buyer < ActiveRecord::Base
  has_many :cards
  has_many :credit_card_payments
end
