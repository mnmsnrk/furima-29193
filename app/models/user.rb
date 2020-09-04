class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:birth_date, presence: true
  
  VALID_PASSWORD_REGEX =/\A[a-z\d]{6,12}+\z/i
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6~12文字英数字それぞれ１文字以上含む必要があります"}
            
  validates :password, confirmation: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true,format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  with_options presence:true do
    validates :first_name,:last_name,format:{ with: /\A[ぁ-んァ-ン一-龥]/,message:"は全角で入力してください。"}
    validates :first_name_kana,:last_name_kana,format:{with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
  end

end
