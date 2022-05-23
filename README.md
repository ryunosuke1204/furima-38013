## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| email              | string | unique: true,null:fales|
| password           | string | null: fales            |
| encrypted_password | string | null: false            |
| nickname           | string | null: false            |
| first_name         | string | null: false            |
| last_name          | string | null: false            |
| first_name_kana    | string | null: false            |
| last_name_kana     | string | null: false            |
| barth_day          | string | null: false            |

## Association

has_many:purchase_management
has_many: items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_image         | string | null: false |
| item_name          | string | null: false |
| introduction       | text   | null: false |
| category           | integer | null: false |
| item_condition     | string | null: false |
| postage_memus       | integer | null: false |
| preparation_days    | integer | null: false,foreign_key: true|
| sipping_areas       | integer | null: false, foreign_key: true |
| day_to_shippings    | integer | null: false, foreign_key: true |
| price               | integer | null: false,foreign_key: true |


## Association

has_one : purchase_management
belong_to:users

## purchase_management テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| users   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address

## shipping_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | integer| null: false |
| prefectures        | integer| null: false |
| municipalities     | integer| null: false |
| address            | string| null: false |
| building           | string|             |
| phone_number       | string| null: false |

## Association

belong_to :purchase_management
