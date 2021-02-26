class Adress < ApplicationRecord
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

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture
end
