require 'rails_helper'

describe 'merchants items relationships' do
  context 'merchants/:id/items' do
    it 'lists all items for given merchant' do
      merchant = create(:merchant)
      items = create_list(:item, 3, merchant_id: merchant.id)
      
      get "/api/v1/merchants/#{merchant.id}/items"
      merchant_items_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_items_json.count).to eq(3)
    end
  end
end
