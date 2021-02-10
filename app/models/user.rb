class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   with_options presence: true do
     validates :nickname
     validates :email
     validates :password, format: {
       with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字混合で入力してください。"
      }
     with_options format: {
       with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角（漢字・ひらがな・カタカナ）で入力してください。"
     } do
         validates :first_name
         validates :last_name 
     end
     with_options format: {
       with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力する。"
     } do
       validates :first_name_reading
       validates :last_name_reading
     end
     validates :birth_day
    end
  

  has_many :products
  has_many :orders
end
