require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  context "relationships" do
    it {should belong_to(:item)}
    it {should belong_to(:invoice)}
  end

  describe ".dollar_to_cents_one" do
    it "converts dollars to cents" do
      invoice_item = create(:invoice_item, unit_price: 62333)

      expect(InvoiceItem.dollar_to_cents_one("623.33").id).to eq(invoice_item.id)
    end
  end

  describe "dollar_to_cents_all" do
    it "converts dollars to cents" do
      invoice_item = create(:invoice_item, unit_price: 74333)

      expect(InvoiceItem.dollar_to_cents_all("743.33").first.id).to eq(invoice_item.id)
    end
  end
end
