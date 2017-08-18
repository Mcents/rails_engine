require 'rails_helper'

describe 'invoices items endpoint' do
  context 'invoices/:id/items' do
    it 'returns all invoices items' do
      merchant = create(:merchant)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      item1 = create(:item, merchant_id: merchant.id)
      item2 = create(:item, merchant_id: merchant.id)
      create(:invoice_item, invoice_id: invoice.id, item_id: item1.id)
      create(:invoice_item, invoice_id: invoice.id, item_id: item2.id)

      get "/api/v1/invoices/#{invoice.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first["id"]).to eq(invoice.invoice_items.first.item_id)
    end
  end
end
