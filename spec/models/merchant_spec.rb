require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it {should have_many(:invoices)}
    it {should have_many(:items)}
    it {should have_many(:customers).through(:invoices)}
    it {should have_many(:transactions).through(:invoices)}
  end

  context "find_revenue" do
    it "returns total revenue for merchant" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)

      expect(merchant.find_revenue).to eq(500.00)
    end
  end

  context "favorite_customer" do
    it "returns a merchants most had customer" do
      merchant1, merchant2 = create_list(:merchant, 2)
      customer1, customer2 = create_list(:customer, 2)
      invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
      transaction = create(:transaction, invoice_id: invoice1.id, result: 'success')
      transaction = create(:transaction, invoice_id: invoice1.id, result: 'success')
      transaction = create(:transaction, invoice_id: invoice2.id, result: 'success')

      expect(merchant1.favorite_customer.id).to eq(customer1.id)
    end
  end

  context "most_items_sold" do
    it "returns the most items sold for merchant" do

    end
  end
end
