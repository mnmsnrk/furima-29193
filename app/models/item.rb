class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :handling
  belongs_to_active_hash :prefecture

  with_options presence:true do
    validates :image
    validates :name,length:{maximum: 40,message: "is too long"}
    validates :image_text, length: {maximum: 1000, message: "is too long"}
    validates :price,numericality: { with: /\A[0-9]+\z/, message: "は半角で入力してください。"},
               inclusion: { in: 300..9_999_999, message: "は300〜9,999,999円の範囲内で設定してください"}
  end

  validates :category_id,:condition_id,:postage_id,:prefecture_id,:handling_id, numericality: { other_than: 1 ,message: "を選択してください"}

  belongs_to :user
  has_one_attached :image
  has_one :purchase
end
