class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id, numericality: { other_than: 1 } 

  with_options presence:true do
  validates :name, :image_text, :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id,:price
  end

  belongs_to :user
end
