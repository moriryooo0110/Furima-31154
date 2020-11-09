class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
    redirect_to item_path
    else
    render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description_of_item, :category_id, :days_to_ship_id, :product_status_id, :shipment_source_id, :shipping_fee_burden_id, :price).merge(user_id: current_user.id)
  end
end
