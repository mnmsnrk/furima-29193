class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :handling
  belongs_to_active_hash :prefecture
  
  validates :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id, numericality: { other_than: 1 } 

  with_options presence:true do
  validates :name, :image_text, :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id,:price
  end

  belongs_to :user
  has_one_attached :image
end
