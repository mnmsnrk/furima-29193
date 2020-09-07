class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    @item = Item.new(item_params)
      if @item.save
        redirect_to "/"
      else
        render :new
      end
  end

  def show
    @item = Item.find(params[id])
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :image, :image_text, :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id,:price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end