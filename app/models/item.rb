class Item < ApplicationRecord
  belongs_to :merchant, required: false
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoice_items

  def self.dollar_to_cents_one(params)
    find_by(unit_price: params.gsub!(/[^0-9A-Za-z]/, ''))
  end

  def self.dollar_to_cents_all(params)
    where(unit_price: params.gsub!(/[^0-9A-Za-z]/, ''))
  end

  def best_day
    invoices.joins(:invoice_items)
    .group(:id)
    .order('sum(invoice_items.quantity) DESC, invoices.created_at DESC')
    .first
  end

  def self.most_items_sold(quantity_input = nil)
    joins(invoices: :transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(invoice_items.quantity) DESC")
    .limit(quantity_input)
  end

  def self.top_items(quantity = nil)
    select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS totes_rev")
    .joins(invoices: :transactions)
    .group(:id)
    .order("totes_rev DESC")
    .limit(quantity)
  end
end
