require 'rails_helper'

describe "customers random" do
  context "customers/random.json" do
    it 'returns a random customer' do
      customer = create_list(:customer, 3, first_name: "jane")

      get "/api/v1/customers/random.json"

      cust_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(cust_json.count).to eq(1)
    end
  end
end
