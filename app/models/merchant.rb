class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    # require "pry"; binding.pry
    customers.joins(:transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order('count(*) DESC')
    .first
  end

  # def favorite_customer
  #   transactions.successful
  #   .group(:customer_id)
  #   .order('count_id desc')
  #   .count('id')
  #   .keys[0]
  # end
end
