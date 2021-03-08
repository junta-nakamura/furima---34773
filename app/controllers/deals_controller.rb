class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :first_action, only: :index

  def index
    @address_deal = AddressDeal.new
  end

  def create
    @address_deal = AddressDeal.new(deal_params)
    @item = Item.find(params[:item_id])
    if @address_deal.valid?
      Payjp.api_key = "sk_test_97517dfe6af5a88e23fd8fa0"
      Payjp::Charge.create(
        amount: @item.price,
        card: deal_params[:token],
        currency: 'jpy'
      )
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

  def first_action
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if !@item.deal.blank? || current_user == @item.user
      redirect_to root_path
    end
  end

end


