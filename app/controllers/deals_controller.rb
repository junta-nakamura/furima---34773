class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @address_deal = AddressDeal.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
     redirect_to root_path
    end
  end

  def create
    @address_deal = AddressDeal.new(deal_params)
    if @address_deal.valid?
      @address_deal.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def deal_params
    params.require(:address_deal).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building, :phone, :deal_id)\
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if !@item.deal.blank?
      redirect_to root_path
    end
  end
end