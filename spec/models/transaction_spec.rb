require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "relationships" do
    it {should belong_to(:invoice)}
  end

  context "successful" do
    it "returns successful transactions" do
      transaction1 = create(:transaction, result: "success")
      transaction2 = create(:transaction, result: "failure")
      transaction3 = create(:transaction, result: "success")

      expect(Transaction.successful.first.id).to eq(transaction1.id)
      expect(Transaction.successful.last.id).to eq(transaction3.id)
      expect(Transaction.successful.length).to eq(2)
    end
  end
end
