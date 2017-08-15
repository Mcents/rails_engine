class Item < ApplicationRecord
  belongs_to :merchant, required: false
end
