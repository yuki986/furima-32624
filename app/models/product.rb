class Product < ApplicationRecord
with_options presence: true do
   validates :name
   validates :price
   validates :detail
   validates :category_id
   validates :state_id
   validates :delivery_fee_id
   validates :area_id
   validates :delivery_date_id
end

belongs_to :user
end
