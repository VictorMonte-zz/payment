require "rails_helper"

RSpec.describe "BuyerController", :type => :request do

  describe "POST create" do
    context "with valid attributes" do
      it "return 200" do
        post "/buyers", :params => {
          :buyer => { :name =>  "Bruce", :cpf => "44154412456", :email => "bruce@wayne.com" }
        }

        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid atttributes" do
      it "returns 400" do
        post "/buyers", :params => {
          :buyer => { :cpf => "44154412456", :email => "bruce@wayne.com" }
        }
        
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
