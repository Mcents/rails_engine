require 'rails_helper'

describe 'items finder' do
  context 'item/find?params' do
    it 'returns a specific item' do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/find?name=#{item.name}"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["name"]).to eq(item.name)
    end
  end

  context 'items/find_all?params' do
    it 'returns all items with params' do
      merchant = create(:merchant)
      item1 = create_list(:item, 4, name: "One", merchant_id: merchant.id)
      item2 = create_list(:item, 4, name: "Two", merchant_id: merchant.id)
      item3 = create_list(:item, 4, name: "Three", merchant_id: merchant.id)

      get "/api/v1/items/find_all?name=#{item1.first.name}"
      item_json = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
