class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price
    validates :detail
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivary_date_id
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_date
end
