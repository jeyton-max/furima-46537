# README

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

# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email_address      | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birth_date         | date       | null: false |
| created_at         | datetime   | null: false |
| updated_at         | datetime   | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| category_id        | references | null: false, foreign_key: true |
| condition_id       | references | null: false, foreign_key: true |
| shipping_fee_id    | references | null: false, foreign_key: true |
| prefecture_id      | references | null: false, foreign_key: true |
| shipping_day_id    | references | null: false, foreign_key: true |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association

- belongs_to :user
- has_one :order
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_fee
- belongs_to :prefecture
- belongs_to :shipping_day

## categories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association

- has_many :items

## conditions テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association

- has_many :items

## shipping_fees テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association

- has_many :items

## prefectures テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association

- has_many :items

## shipping_days テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| created_at         | datetime   | null: false                    |
| updated_at         | datetime   | null: false                    |

### Association

- has_many :items


## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| created_at  | datetime   | null: false                    |
| updated_at  | datetime   | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
