 require 'rails_helper'

 describe "items invoice_items" do
   context "items/:id/invoice_items" do
     it "returns all items invoice items" do
       merchant = create(:merchant)
       item = create(:item, merchant_id: merchant.id)
       create_list(:invoice_item, 3, item_id: item.id)

       get "/api/v1/items/#{item.id}/invoice_items"

       invoice_items = JSON.parse(response.body)

       expect(response).to be_success
       expect(invoice_items.first["item_id"]).to eq(item.id)
     end
   end
 end
