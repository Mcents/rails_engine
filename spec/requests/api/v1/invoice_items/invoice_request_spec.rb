require 'rails_helper'

describe "invoice items invoice" do
  context "invoice_items/:id/invoice" do
    it "returns and invoice_items invoice"do
      invoice = create(:invoice)
      invoice_item = create(:invoice_item, invoice_id: invoice.id)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items["id"]).to eq(invoice.id)
    end
  end
end
