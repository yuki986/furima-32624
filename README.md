#テーブル設計

##users テーブル
| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| first_name         | string | null: false                   |
| last_name          | string | null: false                   |
| first_name_reading | string | null: false                   |
| last_name_reading  | string | null: false                   |
| birth_day          | date   | null: false                   |

### Association
- has_many :products
- has_many :orders


## products テーブル
| Column           | Type      | Options           |
| -----------------| --------- | ----------------- |
| name             | string    | null: false       |
| price            | integer   | null: false       |
| detail           | text      | null: false       |
| user             | reference | foreign_key: true |
| category_id      | integer   | null: false       |
| status_id        | integer   | null: false       |
| delivery_fee_id  | integer   | null: false       |
| area_id          | integer   | null: false       |
| delivery_date_id | integer   | null: false       |

### Association
- belong_to :user
- has_one   :order


## orders テーブル
| Column  | Type      | Options           |
| ------- | --------- | ----------------- |
| user    | reference | foreign_key: true |
| product | reference | foreign_key: true |

### Association
- belong_to :user
- belong_to :product
- has_one   :address


## address テーブル
| Column        | Type     | Options           |
| ------------- | -------- | ----------------- |
| postal_code   | string   | null: false       |
| prefecture_id | integer  | null: false       |
| city          | string   | null: false       |
| house_number  | string   | null: false       |
| building_name | string   |                   |
| phone_number  | string   | null:false        |
| order         | reference| foreign_key: true |

### Association
- belong_to :order
