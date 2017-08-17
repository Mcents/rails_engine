class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    customers.joins(:transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order('count(*) DESC')
    .first
  end

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

  def self.total_revenue(date = nil)
    joins(invoices: [:invoice_items, :transactions])
    .select("sum(invoice_items.unit_price * invoice_items.quantity) AS totes_rev")
    .where(invoices: {created_at: date})
    .merge(Transaction.successful)[0].totes_rev
  end

  def self.top_merchants(quantity = nil)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS totes_rev")
    .joins(:transactions, :invoice_items)
    .group(:id)
    .order("totes_rev DESC")
    .limit(quantity)
  end
end
