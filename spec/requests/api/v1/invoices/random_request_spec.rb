require 'rails_helper'

describe 'Random invoice' do
  context 'invoices/random.json' do
    it 'returns a random invoice' do
      invoice = create_list(:invoice, 3)

      get '/api/v1/invoices/random.json'

      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_json.count).to eq(1)
    end
  end
end
