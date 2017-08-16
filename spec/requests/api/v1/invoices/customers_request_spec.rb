require 'rails_helper'

describe 'invoices customers endpoint' do
  context 'invoices/:id/customers' do
    it 'returns all invoices customers' do
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)

      get "/api/v1/invoices/#{invoice.id}/customer"

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers["id"]).to eq(invoice.customer_id)
    end
  end
end
