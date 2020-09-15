class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out ,only: [:index,:create]


  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new(order_params)
     if @item_purchase.valid?
      pay_item
      @item_purchase.save
        return redirect_to root_path
      else
        render 'index' 
    end
  end

   private

   def order_params
     params.permit(:item_id,:post_code,:prefecture_id,:city,:house_number,:building_name,:tell,:price,:token).merge(user_id: current_user.id)
   end

   def pay_item
    @item = Item.find(params[:item_id])
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: @item.price,
       card: order_params[:token],
       currency:'jpy'
     )
   end

  def sold_out
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end