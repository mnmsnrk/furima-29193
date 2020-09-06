class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image_text, :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id,:price).merge(user_id: current_user.id)
  end

end
