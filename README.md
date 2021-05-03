# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_image              | text       | null: false                    |
| item_name               | string     | null: false                    |
| item_info               | text       | null: false                    |
| item_category           | string     | null: false                    |
| item_status             | text       | null: false                    |
| item_shipping_fee       | string     | null: false                    |
| item_prefecture         | string     | null: false                    |
| item_scheduled_delivery | string     | null: false                    |
| item_price              | string     | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchases    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase