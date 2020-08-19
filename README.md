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

| Column    | Type      | Options                        |
| --------  | --------  | ------------------------------ |
| name      | string    | null: false                    |
| image     | string    | null: false                    |
| content   | text      | null: false                    |
| price     | integer   | null: false                    |
| category  | integer   | null: false                    |
| status    | integer   | null: false                    |
| payment   | integer   | null: false                    |
| prefecture| integer   | null: false                    |
| days      | integer   | null: false                    |
| user      | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one: address


## addressテーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| place       | integer   | null: false                   |
| postal_code | string    | null: false                   |
| city        | string    | null: false                   |
| house_number| string    | null: false                   |
| building    | string    |                               |
| phone       | string    | null: false                   |
| order       | reference | null:false, foreign_key: true |


### Association

- belongs_to: order