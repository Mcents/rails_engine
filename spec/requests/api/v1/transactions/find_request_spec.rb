require 'rails_helper'

describe "transactions finder" do
  context "transaction/find?params" do
    it "returns a specific transaction" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?name=#{transaction.result}"

      transaction_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_json["result"]).to eq(transaction.result)
    end
  end
end
