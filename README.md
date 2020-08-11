# README
#テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ------------|
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column    | Type      | Options      |
| --------  | --------  | ------------ |
| name      | string    | null: false  |
| content   | text      | null: false  |
| price     | integer   | null: false  |
| category  | integer   | null: false  |
| status    | integer   | null: false  |
| user_id   | reference | null: false  |
| order_id  | reference | null: false  |

### Association

- belongs_to :user
- has_one :order

## addressテーブル

| Column      | Type      | Options         |
| ----------- | --------- | --------------- |
| prefecture  | string    | null: false     |
| postal_code | integer   | default:" "     |
| city        | integer   | default:" "     |
| house_number| integer   | default:" "     |
| building    | integer   | default:" "     |
| user_id     | reference | null: false     |
| item_id     | reference | null: false     |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## ordersテーブル

| Column     | Type      | Options         |
| ---------- | --------- | --------------- |
| place      | string    | null: false     |
| payment    | string    | null: false     |
| days       | string    | null: false     |
| message    | text      | default:" "     |
| address_id | reference | null: false     |

### Association

- belongs_to :address