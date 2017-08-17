class Api::V1::Merchants::QuantityController < ApplicationController

  def index
    merchants = Merchant.all
    render json: merchants.top_merchants(params[:quantity])  
  end
end
