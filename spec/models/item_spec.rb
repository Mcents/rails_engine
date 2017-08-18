require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should belong_to(:merchant)}
    it { should have_many(:invoice_items)}
    it { should have_many(:invoices)}
    it { should have_many(:transactions)}
  end

  describe 'class methods' do
    describe '#' do

    end
  end

  describe 'instance methods' do
    describe '.' do

    end
  end
end
