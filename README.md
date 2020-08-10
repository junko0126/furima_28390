# README
#テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ------------|
| u_name   | string | null: false |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column    | Type   | Options     |
| --------  | ------ | ------------|
| i_name    | string | null: false |
| i_content | text   | null: false |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ------------|
| comment  | string | null: true  |

### Association

- belongs_to :user
- belongs_to :item 