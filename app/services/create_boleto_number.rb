class CreateBoletoNumber
  def call
    Random.new.rand(7777777777777777777777..8888888888888888888888888).to_s
  end
end
