class Transaction < ApplicationRecord
  belongs_to :invoice, required: false


  def self.successful
    where(result: "success")
  end
end
