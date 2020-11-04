# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_name_kana    | string     | null: false |
| last_name_kana     | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false, foreign_key: true |
| item_condition_id  | integer    | null: false, foreign_key: true |
| shipping_payer_id  | integer    | null: false, foreign_key: true |
| prefecture_code_id | integer    | null: false                    |
| preparation_day_id | integer    | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :order

## address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null : false                   |
| prefecture_code_id | integer    | null : false                   |
| city               | string     | null : false                   |
| house_number       | string     | null : false                   |
| building_name      | string     |                                |
| phone_number       | string     | null : false                   |
| order              | references | null: false, foreign_key: true |


### Association
- belongs_to :orders

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association
- has_one :address
- belongs_to :item
- belongs_to :user

