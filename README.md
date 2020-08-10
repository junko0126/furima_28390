# README
#テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ------------|
| first_name       | string | null: false |
| family_name      | string | null: false |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column    | Type      | Options      |
| --------  | --------  | ------------ |
| i_name    | string    | null: false  |
| i_content | text      | null: false  |
| price     | integer   | null: false  |
| category  | string    | null: false  |
| status    | string    | null: false  |
| user_id   | reference | null: false  |
| order_id  | reference | null: false  |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column      | Type      | Options         |
| ----------- | --------- | --------------- |
| prefecture  | string    | null: false     |
| payment     | string    | null: false     |
| day         | string    | null: false     |
| user_id     | reference | null: false     |
| item_id     | reference | null: false     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column     | Type      | Options         |
| ---------- | --------- | --------------- |
| address    | string    | null: false     |
| order_id   | reference | null: false     |

### Association

- belongs_to :order