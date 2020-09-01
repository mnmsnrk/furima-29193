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
- has_many :item
- has_many :purchases

## items テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user             | references | null :false,uniqueness: true |
| name             | string     | null: false                  |
| image_text       | text       | null: false                  |
| image_id         | integer    | null: false                  |
| category_id      | integer    | null: false                  |
| condition_id     | integer    | null: false                  |
| postage_payer_id | integer    | null: false                  |
| prefecture_id    | integer    | null: false                  |

### Association
- has_many :images
- has_one :purchases
- has_one :users

## address テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| post_code       | string     | null: false                  |
| prefecture_id   | integer    | null: false,foreign_key:true |
| city            | string     | null: false                  |
| building_name   | string     | null: false                  |
| tell            | string     | null: false,uniqueness :true |
| purchase        | references | null: false,foreign_key:true |

### Association
- has_one :purchases

## images テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| image           | string     | null: false                  |
| item            | references | null: false,foreign_key:true |

### Association
- has_many :items

## purchase テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| item            | references | null: false,foreign_key:true |
| user            | references | null: false,foreign_key:true |

### Association
- has_many :images
- belongs_to :items
- belongs_to :address

## category(active_hash) テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| category        | string     | null: false                  |

### Association
- 

## condition(active_hash) テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| condition       | string     | null: false                  |

### Association
- 

## handling_time(active_hash) テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| handling_time   | string     | null: false                  |

## postage_payer(active_hash) テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| postage_payer   | string     | null: false                  |

## prefecture(active_hash) テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| prefecture      | string     | null: false                  |
