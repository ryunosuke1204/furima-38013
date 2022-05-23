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
| birth_day          | date | null: false              |

## Association

has_many :purchase_managements
has_many :items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| introduction       | text   | null: false |
| category_id        | integer | null: false |
| item_condition_id  | integer  | null: false |
| postage_memu_id     | integer | null: false|
| preparation_day_id  | integer | null: false|
| sipping_area_id     | integer | null: false|
| price               | integer | null: false |
| users                | references | null: false, foreign_key: true |

## Association

has_one :purchase_management
belong_to :user

## purchase_managements テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| users    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

has_many :users
has_one :item
has_one :shipping_address

## shipping_addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| sipping_area_id    | integer| null: false|
| municipalities     | string| null: false |
| address            | string| null: false|
| building           | string|            |
| phone_number       | string| null: false|
| purchase_managements|references | null: false, foreign_key: true |
## Association


belong_to :purchase_management
