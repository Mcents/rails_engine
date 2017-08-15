require 'rails_helper'

describe 'invoices finder' do
  context 'invoice/find?params' do
    it 'returns a specific invoice' do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
