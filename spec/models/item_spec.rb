require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id) #user_id: user[:id]
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end

  describe '出品機能' do
    context '出品機能がうまく行くとき' do
      it "全てが入力されていれば出品ができる" do
        expect(@item).to be_valid
      end
    end

    context '出品機能がうまくいかないとき' do
      it "画像がないとと出品できない" do
        @item.image= nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.name=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと出品できない" do
        @item.image_text=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image text can't be blank")
      end
      it "カテゴリーの情報がないと出品できない" do
        @item.category_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "配送料負担についての情報がないと出品できない" do
        @item.postage_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage Select")
      end
      it "発送元の地域について情報がないと出品できない" do
        @item.prefecture_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "発送までの日数について情報がないと出品できない" do
        @item.handling_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling Select")
      end
      it "価格の入力がないと出品できない" do
        @item.price="" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が¥300~¥9,999,999の間以外だと出品できない" do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "販売価格は半角数字で入力しないと出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角で入力してください。")
      end

    end
  end
end