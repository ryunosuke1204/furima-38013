## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| email              | string | unique: true,null:fales|
| encrypted_password | string | null: false            |
| nickname           | string | null: false            |
| first_name         | string | null: false            |
| last_name          | string | null: false            |
| first_name_kana    | string | null: false            |
| last_name_kana     | string | null: false            |
| barth_day          | date | null: false            |

## Association

has_many :purchase_managements
has_many :items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| introduction       | text   | null: false |
| category           | integer | null: false |
| item_condition     | string | null: false |
| postage_memu_id     | integer | null: false|
| preparation_day_id  | integer | null: false|
| sipping_area_id     | integer | null: false|
| price_id            | integer | null: false|


## Association

has_one :purchase_managements
belong_to :user

## purchase_management テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

has_many :users
has_one :items
has_one :shipping_addresses

## shipping_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| sipping_area_id    | integer| null: false,foreign_key: true|
| municipalities     | string| null: false, foreign_key: true |
| address            | string| null: false, foreign_key: true |
| building           | string|              foreign_key: true |
| phone_number       | string| null: false, foreign_key: true |

## Association


belong_to :purchase_management
