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
| barth_day          | date   | null: false            |

## Association

has_many :purchase_managements
has_many :items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| introduction       | text   | null: false |
| category           | integer | null: false |
| item_condition     | integer  | null: false |
| postage_memu_id    | references | null: false, foreign_key: true |
| preparation_day_id  | references | null: false, foreign_key: true |
| sipping_area_id     | references | null: false, foreign_key: true |
| price_id            | references | null: false, foreign_key: true |


## Association

has_one :purchase_managements
belong_to :user

## purchase_managements テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

has_many :users
has_one :items
has_one :shipping_addresseses

## shipping_address テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| post_code        | string | null: false |
| sipping_area_id  | references | null: false, foreign_key:true |
| municipalities   | references | null: false, foreign_key: true |
| address          | references | null: false, foreign_key: true |
| building         | references |              foreign_key: true |
| phone_number     | references | null: false, foreign_key: true |

## Association


belong_to :purchase_managements
