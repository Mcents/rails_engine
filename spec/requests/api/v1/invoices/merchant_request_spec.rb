 require 'rails_helper'

 describe 'invoices merhant endpoint' do
   context 'invoices/:id/merchant' do
     it 'returns the invoices merchant' do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)

      get "/api/v1/invoices/#{invoice.id}/merchant"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants["id"]).to eq(invoice.merchant_id)
     end
   end
 end
