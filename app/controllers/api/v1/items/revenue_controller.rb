class Api::V1::Items::RevenueController < ApplicationController

  def index
    items = Item.all
    # require "pry"; binding.pry
    render json: items.top_items(params[:quantity])
  end
end
