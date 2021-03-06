require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        #ユーザー情報
        it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end


  
      context '新規登録がうまくいかないとき' do
        #ユーザー情報
        it "nicknameが空だと登録できない" do
          @user.nickname= ""
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
        it "emailが空では登録できない" do
          @user.email=""
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end
        it "emailに@がなければ登録できない" do
          @user.email="aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが空では登録できない" do
          @user.password= ""
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
        it "passwordが5文字以下だと登録できない" do
          @user.password = '00000'
          @user.password_confirmation='00000'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end
        it "passwordが半角英数字混合でなければ登録できない" do
          @user.password = "ＡＡＡＡＡＡ７"
          @user.password_confirmation="ＡＡＡＡＡＡ７"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角英数で入力してください。")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end

        #本人情報確認
        it "ユーザー本名の苗字がなければ登録できない" do
            @user.first_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("姓を入力してください")
        end
        it "ユーザー本名の名前がなければ登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("名前を入力してください")
        end
        it "ユーザー本名が全角でなければ登録できない" do
          @user.first_name = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("姓は全角で入力してください。")
        end
        it "ユーザー本名（苗字）のフリガナがなければ登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("姓のフリガナを入力してください")
        end
        it "ユーザー本名（名前）のフリガナがなければ登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("名前のフリガナを入力してください")
        end
        it "ユーザー本名（苗字）のフリガナが全角カタカナでなければ登録できない" do
          @user.first_name_kana = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("姓のフリガナは全角カタカナで入力して下さい。")
        end

        it "ユーザー本名（名前）のフリガナが全角カタカナでなければ登録できない" do
          @user.last_name_kana = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("名前のフリガナは全角カタカナで入力して下さい。")
        end

        it "生年月日がなければ登録できない" do
          @user.birth_date =""
          @user.valid?
          expect(@user.errors.full_messages).to include("生年月日を入力してください")
        end

      end
    end
  end