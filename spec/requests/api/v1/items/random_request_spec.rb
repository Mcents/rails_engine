require 'rails_helper'

describe 'Random item' do
  context 'items/random.json' do
    it 'returns a random item' do
      merchant = create(:merchant)
      item = create_list(:item, 3, merchant_id: merchant.id)

      get '/api/v1/items/random.json'

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.count).to eq(1)
    end
  end
end
