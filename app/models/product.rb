class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, 
      message: "設定範囲外です。300~9999999の範囲で設定してください。"}
    validates :price, format: {
      with: /\A[0-9]+\z/, message: "半角数字で入力してください"
    }  
    validates :detail
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_date_id
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_date
end
