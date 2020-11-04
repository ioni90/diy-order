# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :orders
- has_many :bids
- has_many :works
- has_one :appreciation

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| story            | text       | null: false                    |
| type_id          | integer    | null: false                    |
| price            | integer    | null: false                    |
| size             | string     | null: false                    |
| material         | text       |                                |
| detail           | text       |                                |
| delivery_time_id | integer    | null: false                    |
| user_id          | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_many :bids
- has_one :closures

## closures テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| order_id | references | null: false, foreign_key: true |
| bid_id   | references | null: false, foreign_key: true |
| reply    | text       |                                |

### Association

- belongs_to :order
- belongs_to :bid
- has_one :address

## bids テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| order_id             | references | foreign_key: true, null: false |
| user_id              | references | foreign_key: true, null: false |
| price_ok             | boolean    | default: false, null: false    |
| size_ok              | boolean    | default: false, null: false    |
| material_ok          | boolean    | default: false, null: false    |
| detail_ok            | boolean    | default: false, null: false    |
| delivery_time_ok     | boolean    | default: false, null: false    |
| price_remark         | text       | null: false                    |
| size_remark          | text       | null: false                    |
| material_remark      | text       | null: false                    |
| detail_remark        | text       | null: false                    |
| delivery_time_remark | text       | null: false                    |
| message              | text       | null: false                    |
| offer_price          | integer    |                                |

### Association

- belongs_to :user
- belongs_to :order
- has_one :closure

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| postal_code | string     | null: false                    |
| prefecture  | integer    | null: false                    |
| location    | string     | null: false                    |
| building    | string     |                                |
| phone       | string     | null: false                    |
| closure_id  | references | foreign_key: true, null: false |

### Association

- belongs_to :closure

## works テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

### Association

- belongs_to :user
- has_one :appreciation

## appreciations テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| work_id  | references | null: false, foreign_key: true |
| tip      | integer    |                                |
| message  | text       | null: false, foreign_key: true |

### Association

- belongs_to :work
- belongs_to :user

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
