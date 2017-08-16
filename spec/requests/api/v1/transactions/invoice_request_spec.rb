require 'rails_helper'

describe 'transaction invoice relationship' do
  context 'transactions/:id/invoice' do
    it 'returns the associated invoice' do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/transactions/#{transaction.id}/invoice"
      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["id"]).to eq(invoice.id)
    end
  end
end
