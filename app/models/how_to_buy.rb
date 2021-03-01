class HowToBuy
  include ActiveModel::Module 
  # orderとadressのテーブルのカラム名を属性値として扱えるようにする。
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :product

  # adressテーブルのバリデーションを持ってくる。
  with_options presence: true do
    validates :postal_code, format: {
      with: /\A\d{3}[-]\d{4}\z/, message: "ハイフンありの7桁の郵便番号を入力してください"
    }
    validates :city,　format: {
      with: /\A[一-龥]+\z/, message: "漢字で市区町村を入力してください"
    }
    validates :house_number
    validates :phone_number, format: {
      with: /\A\d{10,11}\z/, message: "ハイフンなしで11桁以内で電話番号を入力してください(例)09033611156)"
    }
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  # データをテーブルで保存する処理
  def save
    # 住所の情報の保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, )
    # 購入情報の保存
    Order.create(user_id: user.id, product_id: product.id)
  end
end