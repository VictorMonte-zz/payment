class Buyer < ActiveRecord::Base
  has_many :cards
  has_many :credit_card_payments
  has_many :boleto_payments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false  }, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :cpf, presence: true

end
