# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :profile
- has_one :credit_card

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| category        | references | null: false, foreign_key: true |
| item_condition  | references | null: false, foreign_key: true |
| shipping_payer  | references | null: false, foreign_key: true |
| prefecture_code | integer    | null: false                    |
| preparation_day | references | null: false, foreign_key: true |
| seller          | references | null: false, foreign_key: true |
| buyer           | references | foreign_key: true              |


### Association

- belongs_to :user
- belongs_to :category
- belongs_to :item_condition
- belongs_to :shipping_year
- belongs_to :preparation_day

## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| birth_year      | date       | null: false                    |
| birth_month     | date       | null: false                    |
| birth_day       | date       | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## credit_cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :items

## item_conditions テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| item_condition | string | null: false |

### Association

- has_many :items

## shipping_payers テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| shipping_payer | string | null: false |

### Association

- has_many :items

## preparation_days テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| preparation_day | string | null: false |

### Association

- has_many :items