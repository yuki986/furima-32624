FactoryBot.define do
  factory :user do
    nickname {'kuririn'}
    email {Faker::Internet.free_email}
    password {'000000a'}
    password_confirmation {password}
    first_name {'栗'}
    last_name {'悠'}
    first_name_reading {'クリ'}
    last_name_reading {'ユウ'}
    birth_day {'2000-10-13'}
  end
end