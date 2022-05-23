## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| email              | string | unique: true,null:fales|
| password           | string | unique: true,null:fales|
| encrypted_password | string | null: false            |
| nickname           | string | null: false            |
| first_name         | string | null: false            |
| last_name          | string | null: false            |
| first_name_kana    | string | null: false            |
| last_name_kana     | string | null: false            |
| barth_day          | string | null: false            |

## Association

belong_to: shipping_address
belong_to:purchase_management
belong_to : items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_image         | string | null: false |
| item_name          | string | null: false |
| introduction       | text   | null: false |
| category           | integer | null: false |
| item_condition     | string | null: false |
| postage_memu       | integer | null: false |
| preparation_day    | integer | null: false |
| sipping_area       | integer | null: false |
| day_to_shipping    | integer | null: false |
| price              | integer | null: false |


## Association

has_many : items
has_many : shipping_address
belong_to:users

## purchase_management テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| credit_card        | integer| null: false |
| card_validity      | integer| null: false |
| security_code      | integer| null: false |

## Association

belong_to : users
belong_to : shipping_address
has_many : items

## shipping_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | integer| null: false |
| prefectures        | integer| null: false |
| municipalities     | integer| null: false |
| address            | integer| null: false |
| building           | integer|             |
| phone_number       | integer| null: false |

## Association

belong_to :purchase_management
belong_to:users
has_many : items