class BoletoPayment < ActiveRecord::Base
  belongs_to :buyer 
end
