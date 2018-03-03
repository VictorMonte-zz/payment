class Card < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :credit_card_payment, optional: true
  
  validates :holder_name, presence: true
  validates :number, presence: true, length: { is: 16  }
  validates :expiration_date, presence: true
  validates :cvv, presence: true
end
