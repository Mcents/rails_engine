class Invoice < ApplicationRecord
  belongs_to :customer, required: false
  belongs_to :merchant, required: false
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.date_match(date = nil)
    if date
      where(:created_at => date.to_datetime)
    else
      all
    end
  end
end
