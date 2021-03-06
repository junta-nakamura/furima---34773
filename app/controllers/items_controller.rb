class ItemsController < ApplicationController
before_action :authenticate_user!, except: :index
  
  def index
    # @items = Item.all.order("updated_at DESC")
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  def item_params
    params.require(:item).permit(:product_name, :detail, :category_id, :status_id, :delivery_fee_id, :prefectures_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end