require 'rails_helper'

describe 'customers with pending invoices by merchant' do
  context 'merchants/:id/customers_with_pending_invoices' do
    it 'returns an all customers with pending invoices' do
      merchant = create(:merchant)
      customer1 = create(:customer)
      customer2 = create(:customer)

      p_invoice1 = create(:invoice, merchant_id: merchant.id, customer_id: customer1.id)
      p_invoice2 = create(:invoice, merchant_id: merchant.id, customer_id: customer1.id)
      p_transact1 = create(:transaction, result: "failed", invoice_id: p_invoice1.id)
      p_transact2 = create(:transaction, result: "failed", invoice_id: p_invoice2.id)

      s_invoice1 = create(:invoice, merchant_id: merchant.id, customer_id: customer2.id)
      s_invoice2 = create(:invoice, merchant_id: merchant.id, customer_id: customer2.id)
      s_transact1 = create(:transaction, result: "success", invoice_id: s_invoice1.id)
      s_transact2 = create(:transaction, result: "success", invoice_id: s_invoice2.id)

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
      cust_with_pend = JSON.parse(response.body)

      expect(response).to be_success
      expect(cust_with_pend).to eq(1)
    end
  end
end
