require 'rails_helper'

describe 'merchants favorite customer' do
  context 'merchants/:id/favorite_customer' do
    it 'returns the customer with the most successful transactions for a merchant' do
      merchant = create(:merchant)
      customer1 = create(:customer)
      customer2 = create(:customer)
      invoice1 = create(:invoice, merchant_id: merchant.id, customer_id: customer1.id)
      invoice2 = create(:invoice, merchant_id: merchant.id, customer_id: customer1.id)
      invoice3 = create(:invoice, merchant_id: merchant.id, customer_id: customer2.id)
      transact1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      transact2 = create(:transaction, invoice_id: invoice2.id, result: "success")
      transact3 = create(:transaction, invoice_id: invoice3.id, result: "success")

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"
      fav_cust = JSON.parse(response.body)

      expect(response).to be_success
      expect(fav_cust["id"]).to eq(customer1.id)
    end
  end
end
