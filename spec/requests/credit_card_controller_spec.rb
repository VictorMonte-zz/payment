require "rails_helper"

RSpec.describe "CreditCardsController" do

  describe "POST create" do
    context "with valid attributes" do

      it "return 200" do
        @buyer =  Buyer.create(name: "Goku", cpf: "12456354786", email: "son-goku@mail.com")

        post "/buyers/#{@buyer.cpf}/credit-cards/", :params => {
          :card => {
            :holder_name => "GOKU",
            :number => "1234123412341234",
            :expiration_date => Date.parse("2016-01-01"),
            :cvv => 123
          }
        }

        expect(response).to have_http_status(:ok)
      end

    end

    context "with invalid attributes" do

      it "return 400" do

        @buyer =  Buyer.create(name: "Goku", cpf: "12456354786", email: "son-goku@mail.com")

        post "/buyers/#{@buyer.cpf}/credit-cards/", :params => {
          :card => {          
            :number => "1234123412341234",
            :expiration_date => Date.parse("2016-01-01"),
            :cvv => 123
          }
        }

        expect(response).to have_http_status(:bad_request)
      end

    end
  end

end

