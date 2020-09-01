# テーブル設計

## users テーブル

| Column          | Type   | Options                      |
| --------------- | ------ | ---------------------------- |
| nickname        | string | null: false                  |
| email           | string | null :false,uniqueness: true |
| password        | string | null :false,uniqueness: true |
| first_name      | string | null: false                  |
| last_name       | string | null: false                  |
| first_name_kana | string | null: false                  |
| last_name_kana  | string | null: false                  |
| birth_date      | date   | null: false                  |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user             | references | null :false,foreign_key:true |
| name             | string     | null: false                  |
| category_id      | integer    | null: false                  |
| condition_id     | integer    | null: false                  |
| postage_payer_id | integer    | null: false                  |
| prefecture_id    | integer    | null: false                  |
| handling_time_id | integer    | null: false                  |
| price            | integer    | null: false                  |

### Association
- has_many :images
- has_one :purchases
- has_one :users

## address テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| post_code       | string     | null: false                  |
| prefecture_id   | integer    | null: false                  |
| city            | string     | null: false                  |
| building_name   | string     |                              |
| tell            | string     | null: false,uniqueness :true |
| purchase        | references | null: false,foreign_key:true |

### Association
- has_one :purchases

## purchase テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| item            | references | null: false,foreign_key:true |
| user            | references | null: false,foreign_key:true |

### Association
- belongs_to :item
- belongs_to :address
- belongs_to :user
