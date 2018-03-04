class Checkout < ActiveRecord::Base
  validates_presence_of :buyer
  validates_presence_of :payment

  attr_accessor :buyer
  attr_accessor :payment
  attr_accessor :credit_card
end
