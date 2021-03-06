class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_product, only: [:show, :edit, :update, :destroy]
before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.all.order("updated_at DESC")
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

  def show
  end

  def edit
    if !@item.deal.blank?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private 
  def item_params
    params.require(:item).permit(:product_name, :detail, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

end