require 'rails_helper'

describe 'invoice_items finder' do
  context 'invoice_items/find?params' do
    it 'returns a specific invoice_item' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json["id"]).to eq(invoice_item.id)
    end
  end

  context 'invoice_items/find_all?params' do
    it 'returns all invoice_items with params' do
      invoice_item1 = create_list(:invoice_item, 3, quantity: 13)
      invoice_item2 = create_list(:invoice_item, 3, quantity: 2)

      get "/api/v1/invoice_items/find_all?quantity=#{invoice_item1.first.quantity}"
      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json.first["quantity"]).to eq(13)
      expect(invoice_item_json.count).to eq(3)
    end
  end
end
