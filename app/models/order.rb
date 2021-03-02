class Order < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :product_id
  end

  belongs_to :user
  belongs_to :product
  has_one :address
end
