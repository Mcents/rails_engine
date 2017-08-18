class Api::V1::Merchants::CustomersController < ApplicationController

  def show
    render json: Merchant.find(params[:id]).favorite_customer
  end

  def index
    merchant = Merchant.find(params[:id])
    render json: merchant.customers_with_pending_invoices
  end
end
