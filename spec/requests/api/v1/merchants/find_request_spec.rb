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

  context "merchant/find_all?params" do
    it "returns all merchants with params" do
      merchant1 = create_list(:merchant, 3, name: "mike")
      merchant2 = create_list(:merchant, 2, name: "john")

      get "/api/v1/merchants/find_all?name=#{merchant1.first.name}"
      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["name"]).to eq("mike")
      expect(item_json.count).to eq(3)
    end
  end
end
