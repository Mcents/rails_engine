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

  context "customers/find_all?params" do
    it "returns all customers with params" do
      customer1 = create_list(:customer, 3, first_name: "bob")
      customer2 = create_list(:customer, 3, first_name: "jane")

      get "/api/v1/customers/find_all?first_name=#{customer1.first.first_name}"
      cust_json = JSON.parse(response.body)
      
      expect(response).to be_success
      expect(cust_json.first["first_name"]).to eq("bob")
      expect(cust_json.count).to eq(3)
    end
  end
end
