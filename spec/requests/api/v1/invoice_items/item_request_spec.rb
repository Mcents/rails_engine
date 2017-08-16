require 'rails_helper'

describe "invoice items item" do
  context "invoice_items/:id/item" do
    it "returns an invoice items item" do
      item = create(:item)
      invoice_item = create(:invoice_item, item_id: item.id)

      get "/api/v1/invoice_items/#{invoice_item.id}/item"
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items["id"]).to eq(item.id)
    end
  end
end
