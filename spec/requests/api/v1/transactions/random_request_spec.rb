require 'rails_helper'

describe 'transactions random' do
  context 'transactions/random/json' do
    it 'returns a random transaction' do
      transaction = create_list(:transaction, 3, result: "good")

      get "/api/v1/transactions/random.json"

      trans_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(trans_json.count).to eq(1)
    end
  end
end
