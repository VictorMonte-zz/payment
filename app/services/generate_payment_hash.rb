require 'digest'

class GeneratePaymentHash

  def initialize(id, amount)
    @id = id
    @amount = amount
  end

  def call
    create_hash
  end

  private

  attr_reader :id
  attr_reader :amount

  def create_hash
    @md5 =  Digest::MD5.hexdigest(id.to_s + amount.to_s + Time.now.to_s)
    ("PAY-" + @md5)[0..10]
  end

end
