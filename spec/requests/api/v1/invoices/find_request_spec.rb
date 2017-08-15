require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'invoices finder' do
  context 'invoice/find?params' do
    it 'returns a specific invoice' do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_json["id"]).to eq(invoice.id)
    end
  end

  context 'invoice/find_all?params' do
    it 'returns all invoices with params' do
      invoice1 = create_list(:invoice, 4, status: "shipped")
      invoice2 = create_list(:invoice, 2, status: "cancelled")

      get "/api/v1/invoices/find_all?status=#{invoice1.first.status}"
      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_json.first["status"]).to eq("shipped")
      expect(invoice_json.count).to eq(4)
    end
  end
end

DatabaseCleaner.clean
