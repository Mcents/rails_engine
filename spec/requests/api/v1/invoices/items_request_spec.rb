require 'rails_helper'

describe 'invoices items endpoint' do
  context 'invoices/:id/items' do
    it 'returns all invoices items' do
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      item1 = create(:item)
      item2 = create(:item)
      create(:invoice_item, invoice_id: invoice.id, item_id: item1.id)
      create(:invoice_item, invoice_id: invoice.id, item_id: item2.id)

      get "/api/v1/invoices/#{invoice.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first["id"]).to eq(invoice.invoice_items.first.item_id)
    end
  end
end
