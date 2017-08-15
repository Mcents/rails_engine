class Invoice < ApplicationRecord
  belongs_to :customer, required: false
  belongs_to :merchant, required: false
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
end
