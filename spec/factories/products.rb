FactoryBot.define do
  factory :product do
    name {'売るもの'}
    price {10000}
    detail {'aaaaaaa'}
    category_id {1}
    status_id {1}
    delivery_fee_id {1}
    area_id {1}
    delivery_date_id {1}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/kimetu-19-image.jpg'), filename: 'kimetu-19-image.jpg')
    end

    association :user
  end
end
