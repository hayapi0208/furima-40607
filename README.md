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
| birth_day          | date    | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | string     | null: false |
| item_comment       | text       | null: false |
| item_category_id   | integer    | null: false |
| item_condition_id  | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| delivery_tame_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type   | Options     |
| -------------- | ---------- | ----------- |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type   | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| prefecture_id  | integer    | null: false |
| municipalities | string     | null: false |
| street_address | string     | null: false |
| building       | string     |             |
| telephone      | string     | null: false |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order