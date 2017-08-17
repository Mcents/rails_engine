require 'rails_helper'

describe 'customers invoices relationships' do
  context 'customers/:id/invoices' do
    it 'lists all invoices for a customer' do
      customer = create(:customer)
      invoices = create_list(:invoice, 3, customer_id: customer.id)

      get "/api/v1/customers/#{customer.id}/invoices"
      customer_invoices_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_invoices_json.count).to eq(3)
    end
  end
end
