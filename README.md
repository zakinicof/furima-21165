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
- has_many :users_shipping_address
- has_many :shipping_address, through: :users_shipping_address
- has_many :users_purchase_managements
- has_many :purchase_managements, through: :users_purchase_managements

## items テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| description        | text    | null: false                    |
| price              | integer | null: false                    |
| category_id        | integer | null: false, foreign_key: true |
| item_condition_id  | integer | null: false, foreign_key: true |
| shipping_payer_id  | integer | null: false, foreign_key: true |
| prefecture_code_id | integer | null: false                    |
| preparation_day_id | integer | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :shipping_address
- has_one :purchase_management

## shipping_address テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | integer    | null : false                  |
| prefecture_code | integer    | null : false                  |
| municipality    | string     | null : false                  |
| address         | string     | null : false                  |
| building_name   | string     |                               |
| phone_number    | integer    | null : false                  |
| user_id         | references | null: false, foreign_key: true|
| item_id         | references | null: false, foreign_key: true|

### Association

- belongs_to :item
- has_many :users_shipping_address
- has_many :users, through: :users_shipping_address

## users_shipping_address テーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | ------------ |
| user             | references | null : false, foreign_key: true |
| shipping_address | references | null : false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :shipping_address

## purchase_managements テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| card_number     | integer    | null : false                  |
| expiration_date | integer    | null : false                  |
| security_code   | integer    | null : false                  |
| user_id         | references | null: false, foreign_key: true|
| item_id         | references | null: false, foreign_key: true|


### Association

- belongs_to :item
- has_many :users_purchase_managements
- has_many :users,through: :users_purchase_managements

## users_purchase_managements テーブル

| Column               | Type       | Options                         |
| -------------------- | ---------- | ------------------------------- |
| user                 | references | null : false, foreign_key: true |
| purchase_managements | references | null : false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :purchase_managements