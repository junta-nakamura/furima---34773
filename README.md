# テーブル設計



## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kanji   | string | null: false               | 
| last_name_kana     | string | null: false               |  
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :deals



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| detail          | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| location_id     | integer    | null: false                    |
| days_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :addresses
- has_one :deals



## deals テーブル

| Column            | Type       | Options                        |
|------------------ | ---------- |------------------------------- |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column         | Type       | Options                        |
|--------------- | ---------- |------------------------------- |
| postal_code    | string     | null: false                    |
| location_id    | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| deal           | references | null: false, foreign_key: true |

### Association

- belongs_to :deal
