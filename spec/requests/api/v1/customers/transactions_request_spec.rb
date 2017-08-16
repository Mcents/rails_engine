require 'rails_helper'

describe 'customers transactions relationships' do
  context 'customers/:id/transactions' do
    it 'lists all transactions for a customer' do
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)
      transactions = create_list(:transaction, 3, invoice_id: invoice.id )

      get "/api/v1/customers/#{customer.id}/transactions"
      customer_transactions_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_transactions_json.count).to eq(3)
    end
  end
end
