require 'rails_helper'

describe "merchants finder" do
  context "merchant/find?params" do
    it "returns a specific merchant" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?name=#{merchant.name}"

      merchant_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_json["name"]).to eq(merchant.name)
    end
  end
end
