class Transaction < ApplicationRecord
  belongs_to :invoice, required: false

  def self.successful
    where(result: "success")
  end

  scope :successful,     -> { where(result: 'success')}
  scope :not_successful, -> { where(result: 'failed')}

end
