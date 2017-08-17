require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it "has_many items" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:items)

    end
  end
end
