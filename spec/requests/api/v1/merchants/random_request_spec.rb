require 'rails_helper'

describe "merchants random" do
  context "merchants/random.json" do
    it "returns a random merchant" do
      merchant = create_list(:merchant, 3, name: "mike")

      get "/api/v1/merchants/random.json"

      merchant_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_json.count).to eq(1)
    end
  end
end
