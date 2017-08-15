require 'rails_helper'

describe "customers finder" do
  context "customers/find?params" do
    it "returns a specific customer" do
      customer = create(:customer)

      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      customer_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_json["first_name"]).to eq(customer.first_name)
    end
  end
end
