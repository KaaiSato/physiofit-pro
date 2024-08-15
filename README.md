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

## trainers テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| last_name_reading    | string | null: false               |
| first_name_reading   | string | null: false               |
| age                  | integer| null: false               |
| gender_id               | integer| null: false               |
| prefecture_id        | integer| null: false               |
| city                 | string | null: false               |
| registration_number  | integer| null: false               |
| career               | text   | null: false               |
| profile              | text   | null: false               |
| latitude             | float  |                           |
| longitude            | float  |                           |
| service_radius_km    | integer|                           |

### Association

- has_many :reservations
- has_many :reviews
- has_many :chats
- has_many :messages, through: :chats

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| age                  | integer| null: false               |
| gender_id               | integer| null: false               |
| prefecture_id        | integer| null: false               |
| city                 | string | null: false               |
| profile              | text   | null: false               |

### Association

- has_many :reservations
- has_many :reviews
- has_many :chats
- has_many :messages, through: :chats

## chats テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| trainer   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :trainer
- belongs_to :user
- has_many :messages

## messages テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| sender_type | string     | null: false                    |
| sender_id   | integer    | null: false                    |
| chat        | references | null: false, foreign_key: true |

### Association

- belongs_to :chat


## reservations テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| last_name            | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name_reading    | string     | null: false                    |
| first_name_reading   | string     | null: false                    |
| date                 | date       | null: false                    |
| time_id              | integer    | null: false                    |
| request              | text       | null: false                    |
| trainer              | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :trainer
- belongs_to :user
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| addresses       | string     | null: false                    |
| phone_number    | string     | null: false                    |
| reservation     | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation

## reviews テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| rating   | integer    | null: false                    |
| comment  | text       | null: false                    |
| trainer  | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :trainer
- belongs_to :user


