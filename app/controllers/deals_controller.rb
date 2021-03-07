class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @deal = Deal.create(deal_params)
    Address.create(address_params)
    redirect_to root_path
  end


  private
  def deal_params
    params.permit(:user_id, :item_id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :address, :phone).merge(deal_id: @deal.id)
  end
  
end
