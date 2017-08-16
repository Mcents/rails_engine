 require 'rails_helper'

 describe "items merchant" do
   context "items/:id/merchant" do
     it "returns an items merchant" do
       merchant = create(:merchant)
       item = create(:item, merchant_id: merchant.id)
       
       get "/api/v1/items/#{item.id}/merchant"
       items = JSON.parse(response.body)

       expect(response).to be_success
       expect(merchant["id"]).to eq(item.merchant_id)
     end
   end
 end
