## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| post_code          | string | null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| bullding_number    | string | null: false |
| phone_number       | string | null: false |
| barth_day          | string | null: false |

## Association

has_many : seller_items, foreign_ley:true
has_many:  buyer_items, foreign_ley:true
has_one : profile_items, dependent: :destroy
has_one : credit_card, dependent: :destroy

## item テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| introduction       | text   | null: false |
| price              | string | null: false |
| brand              | string | null: false |
| item_condition     | string | null: false |
| postage_payer      | integer | null: false |
| preparation_day    | integer | null: false |
| postage_type       | integer | null: false |
| category           | integer | null: false |
| trading_status     | integer | null: false |
| seller             | integer | null: false |
| buyer              | reference| null: false |
| barth_day          | reference | null: false |

## Association

has_many : item_images, deprndent: :destroy
belong_to :category
belong_to_active_hash:item_condition
belong_to_active_hash:preparatiom_day
belong_to_active_hash:postage_type
belong_to_active_hash:postage_payer
belong_to :brand
belong_to :seller,class_name:"User"
belong_to :buyer,class_name:"User"

## profile テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| introduction       | text   | null: false |
| avater             | string |             |
| user               | reference |null:fales,foreign_key: true|

## Association

belong_to :user

## credit_cards テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| incard_id          | string | null: false |
| customer_id        | string | null: false |
| user               | reference |null:fales,foreign_key: true|

## Association

belong_to :user

## items_image テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| url                | string | null: false |
| item               | string | null: false |


## Association

belong_to :items

## items_image テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| url                | string | null: false |
| item               | string | null: false |


## Association

belong_to :items

## categories テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| ancesty            | string |           |


## Association

belong_to :items

## item_conditions(active_hash) テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_condition     | integer | null: false |

## Association

belong_to :items

## preparation_day(active_hash)テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| preparation_day     | integer | null: false |

## Association

belong_to :items

## postage_type(active_hash))テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postage_type       | integer | null: false |

## Association

belong_to :items

## postage_payer(active_hash)テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postage_payer      | integer | null: false |

## Association

belong_to :items

## postage_payer(active_hash)テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string |            |

## Association

belong_to :items