class GetBuyerByCpf
  def initialize(cpf)
    @cpf = cpf
  end

  def call
    Buyer.where(cpf: @cpf).first
  end
end
