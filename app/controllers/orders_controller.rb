class OrdersController < ApplicationController
  before_action :set_item, only: [:ensure_correct_user, :index, :create]
  before_action :ensure_correct_user, only: [:index]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_purchase_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def ensure_correct_user
    redirect_to items_index_path if !@item.item_purchase.nil? || current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
