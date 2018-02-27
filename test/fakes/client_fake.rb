class ClientFake
  def self.create
    Client.create(id: 12345)
  end
end
