require 'rails_helper'

describe 'merchants invoices relationships' do
  context 'merchants/:id/invoices' do
    it 'lists all invoices for a merchant' do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 3, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/invoices"
      merchant_invoices_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_invoices_json.count).to eq(3)
    end
  end
end
