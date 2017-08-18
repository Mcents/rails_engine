require 'rails_helper'

describe 'items most items by quantity' do
  context 'items/most_items?quantity' do
    it 'returns the top x items by total sold' do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)
      item1 = create(:item, merchant_id: merchant.id)
      item2 = create(:item, merchant_id: merchant.id)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 30)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 2)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 300)
      invoice_item = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 1)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")

      get "/api/v1/items/most_items?quantity=2"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["id"]).to eq(item1.id)
      expect(item_json.last["id"]).to eq(item.id)
      expect(item_json.count).to eq(2)

    end
  end
end
