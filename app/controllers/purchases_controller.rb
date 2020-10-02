class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out ,only: [:index,:create]


  require 'payjp'

  def index
    card_set
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new

  end

  def create
    redirect_to new_card_path and return unless current_user.card.present?

    card_set
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
    card = Card.find_by(user_id: current_user.id)
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
     Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      customer: card.customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
     )
   end

  def sold_out
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def card_set
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    redirect_to new_card_path and return unless card.present?
    
    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end
end
