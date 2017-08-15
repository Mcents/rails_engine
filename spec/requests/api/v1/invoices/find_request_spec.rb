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
      create_list(:customer, 2)

      invoice1 = create_list(:invoice, 4, customer_id: 2)
      invoice2 = create_list(:invoice, 2, customer_id: 1)
      invoice3 = create_list(:invoice, 1, customer_id: 1)

      get "/api/v1/invoices/find_all?customer_id=#{invoice1.first.customer_id}"
      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end

DatabaseCleaner.clean
