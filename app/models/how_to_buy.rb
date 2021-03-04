class HowToBuy
  include ActiveModel::Model
  # orderとadressのテーブルのカラム名を属性値として扱えるようにする。
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :product_id, :token

  # addressテーブルのバリデーションを持ってくる。
  with_options presence: true do
    validates :token
    validates :postal_code, format: {
      with: /\A\d{3}[-]\d{4}\z/, message: "ハイフンありの7桁の郵便番号を入力してください"
    }
    validates :city, format: {
      with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "全角ひらがな、カタカナ、漢字で市区町村を入力してください"
    }
    validates :house_number
    validates :phone_number, format: {
      with: /\A\d{10,11}\z/, message: "ハイフンなしで11桁以内で電話番号を入力してください(例)09033611156)"
    }

    # orderテーブルのバリデーション
    validates :user_id
    validates :product_id
    # //orderテーブルのバリデーション
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  # データをテーブルで保存する処理
  def save
    # 購入情報の保存
    order = Order.create(user_id: user_id, product_id: product_id)
    # 住所の情報の保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end