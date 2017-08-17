require 'rails_helper'

describe "merchants revenue endpoint" do
  context "merchants/:id/revenue" do
    it "returns total revenue for merchant across all transactions" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)

      get "/api/v1/merchants/#{merchant.id}/revenue"

      revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue_json["revenue"]).to eq("5.0")
    end
  end

  context "merchants/:id/revenue?date" do
    it "returns the total revenue for merchant for date" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-10 00:54:09 UTC")
      invoice1 = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-11 00:54:09 UTC")
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 60, unit_price: 20)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-10 00:54:09"

      revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue_json["revenue"]).to eq("5.0")
    end
  end

  context "merchants/revenue?date" do
    it "returns the total revenue for a date across all merchants" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-11 00:54:09 UTC")
      invoice2 = create(:invoice, merchant_id: merchant2.id, created_at: "2012-03-11 00:54:09 UTC")
      invoice3 = create(:invoice, merchant_id: merchant3.id, created_at: "2012-03-12 00:54:09 UTC")
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 60, unit_price: 10)
      invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 50, unit_price: 20)
      invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 40, unit_price: 30)

      get "/api/v1/merchants/revenue?date=#{invoice1.created_at}"
      revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue_json["revenue"]).to eq("16.0")
    end
  end
end
