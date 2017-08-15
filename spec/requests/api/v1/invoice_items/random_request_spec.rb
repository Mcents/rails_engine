require 'rails_helper'

describe 'Random invoice_item' do
  context 'invoice_items/random.json' do
    it 'returns a random invoice_item' do
      invoice_item = create_list(:invoice_item, 3)

      get '/api/v1/invoice_items/random.json'

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json.count).to eq(1)
    end
  end
end
