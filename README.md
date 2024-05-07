# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | text       | null: false |
| item_comment       | text       | null: false |
| item_category      | string     | null: false |
| item_condition     | string     | null: false |
| delivery_charge    | string     | null: false |
| shipping_source    | string     | null: false |
| delivery_tame      | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type   | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| street_address | string     | null: false |
| building       | string     |             |
| telephone      | integer    | null: false |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item