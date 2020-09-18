require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '購入情報の保存' do
    context '購入情報の保存がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @item_purchase.building_name = nil
        expect(@item_purchase).to be_valid
      end
    end
    
    context '購入情報の保存がうまくいかない時' do
      it 'クレジットカードの情報がなければ保存できない' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号がなければ保存できない' do
        @item_purchase.post_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にはハイフンがなければ保存できない' do
        @item_purchase.post_code = 0000000
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("郵便番号は、ハイフンを入れて入力してください")
      end
      it '都道府県が選択されていなければ保存できない' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市区町村がなければ保存できない' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地がなければ保存できない' do
        @item_purchase.house_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号がなければ保存できない' do
        @item_purchase.tell = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にはハイフンがあると保存できない' do
        @item_purchase.tell = '0000-00000'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Tell は、ハイフン抜きで入力してください")
      end

    end
  end
end
