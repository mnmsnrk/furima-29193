class ItemsController < ApplicationController
  before_action :item_set, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items= Item.all.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
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
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    Item.destroy
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :image, :image_text, :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id,:price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end