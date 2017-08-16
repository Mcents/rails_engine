class Api::V1::Merchants::ItemsController < ApplicationRecord

  def index
    render json: Merchant.find(params[:id]).items
  end
end
