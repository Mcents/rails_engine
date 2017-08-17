class Item < ApplicationRecord
  belongs_to :merchant, required: false
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

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
end

