class InvoiceItem < ApplicationRecord
  belongs_to :item, required: false
  belongs_to :invoice, required: false

  def self.dollar_to_cents(params)
    where(unit_price: params.gsub!(/[^0-9A-Za-a]/,''))
  end

end
