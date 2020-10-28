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
- has_many :purchase_managements

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
| user_id            | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :purchase_management

## shipping_address テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| postal_code             | string     | null : false                  |
| prefecture_code_id      | integer    | null : false                  |
| municipality            | string     | null : false                  |
| address                 | string     | null : false                  |
| building_name           | string     |                               |
| phone_number            | string     | null : false                  |
| purchase_managements_id | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase_management

## purchase_managements テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |


### Association
- has_one :shipping_address
- belongs_to :item
- belongs_to :users

