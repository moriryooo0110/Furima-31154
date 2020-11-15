class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:order]
  before_action :ensure_correct_user, only:[:index]

  def ensure_correct_user
    @item = Item.find(params[:item_id])
    if @item.item_purchase != nil || current_user.id == @item.user_id
      redirect_to items_index_path
     end
   end

  def index
    @item = Item.find(params[:item_id])
    @user_order =UserOrder.new
  end


  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
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
    params.require(:user_order).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:item_purchase_id).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  
        card: order_params[:token],    
        currency: 'jpy'                
      )
  end

end
