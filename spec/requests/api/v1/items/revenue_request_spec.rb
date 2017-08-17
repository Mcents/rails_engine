require 'rails_helper'

describe "items revenue endpoint" do
  context "items/most_revenue?quantity=x" do
    it "returns the top x items ranked by total revenue" do
      item1 = create(:item)
      item2 = create(:item)
      item3 = create(:item)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice3 = create(:invoice)
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id, quantity: 60, unit_price: 20)
      invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 60, unit_price: 10)
      invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id, quantity: 40, unit_price: 30)

      get "/api/v1/items/most_revenue?quantity=2"
      top_items_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(top_items_json.first["id"]).to eq(item1.id)
      expect(top_items_json.last["id"]).to eq(item3.id)
    end
  end
end
