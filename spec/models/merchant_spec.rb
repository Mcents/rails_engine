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
end
