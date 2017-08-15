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

  context "transaction/find_all?params" do
    it "returns all transactions with params" do
      transaction1 = create_list(:transaction, 3, result: "good")
      transaction2 = create_list(:transaction, 3, result: "bad")

      get "/api/v1/transactions/find_all?result=#{transaction1.first.result}"
      t_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(t_json.first["result"]).to eq("good")
      expect(t_json.count).to eq(3)
    end
  end
end
