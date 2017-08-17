class Api::V1::Merchants::MostItemsController < ApplicationController
  
  def index
    merchants = Merchant.all
    render json: merchants.most_items_sold(params[:quantity])
  end

end
