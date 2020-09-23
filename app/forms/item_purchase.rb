class ItemPurchase

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city,:house_number,:building_name,:tell, :price,:item_id,:user_id,:token,:purchase_id

  with_options presence: true do
    validates :city,:house_number
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は、ハイフンを入れて入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 ,message: "を選択してください"}
    validates :tell, format: {with: /\A\d{11}\z/, message: "は、ハイフン抜きで入力してください"}
  end

  
  def save
    @purchase_id = Purchase.create(item_id: item_id,user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city,house_number: house_number, building_name: building_name,tell: tell,purchase_id: @purchase_id.id)
  binding.pry
  end

end