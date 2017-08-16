class Api::V1::Merchants::ItemsController < ApplicationRecord

  def index
    render json: Merchant.join(:items)
  end
end
