class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def find_revenue(date = nil)
    invoices.joins(:invoice_items, :transactions)
    .merge(Invoice.date_match(date))
    .merge(Transaction.successful)
    .sum("quantity * unit_price")
  end

  def self.most_items_sold(quantity_input = nil)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(quantity) DESC")
    .limit(quantity_input)
  end
end
