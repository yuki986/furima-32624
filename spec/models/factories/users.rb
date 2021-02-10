FactoryBot.define do
  factory :user do
    nickname {kuririn}
    email {Faker::Internet.free_email}
    password {'0000000a'}
    password_confirmation {password}
    first_name {'栗林'}
    last_name {'悠貴'}
    first_name_reading {'クリバヤシ'}
    last_name_reading {'ユウキ'}
    birth_day {'2000-10-13'}
  end
end