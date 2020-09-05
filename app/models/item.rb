class Item < ApplicationRecord

  with_options presence:true do
  validates :name, :image_text, :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id,:price
  end
  
  belongs_to :user
end
