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

|  Column         | Type   | Options                              |
| ----------------| ------ | ------------------------------------ |
| first_name      | string | null: false                          |
| last_name       | string | null: false                          |
| first_name_cana | string | null: false                          |
| last_name_cana  | string | null: false                          |
| birthday        | date   | null: false                          |
| phone_number    | string | null: false                          |
| gender_id       | integer| null: false                          |
| stylist_id      | integer| null: false, foreign_key: true       |
| email           | string | null: false                          |
| password        | string | null: false                          |
| age_id          | integer|                                      |
| blood_type_id   | integer|                                      |
| job_id          | integer|                                      |
| customer_number | integer|                                      |
| member_id       | integer| null: false                          |
| admin           | integer| null: false                          |


### Association

- has_one :user_option
- has_one  :address 
- has_many :reservations
- belongs_to :stylist, optional: true
- has_one :user_information
- has_one :user_detail

## user_informations テーブル

|  Column         | Type   | Options                              |
| ----------------| ------ | ------------------------------------ |
| information_date| date   |                                      |
| information_text| text   |                                      |
| visit_time      | integer|                                      |
| customer_text   | text   |                                      |
| member_id       | integer| null: false                          |
| user_id         | integer| null: false, foreign_key: true       |

### Association

- belongs_to :user

## user_details テーブル

|  Column         | Type   | Options                              |
| ----------------| ------ | ------------------------------------ |
| gender_id       | integer|                                      |
| blood_id        | integer|                                      |
| consent_id      | integer| null: false                          |
| job_id          | integer|                                      |
| user_id         | integer| null: false, foreign_key: true       |

### Association

- belongs_to :user

## addresses テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| post_code           | string       | null: false                   |
| prefecture_id       | integer      | null: false                   |
| address_all         | string       | null: false                   |
| user_id             | integer      | null: false, foreign_key: true|

### Association

- belong_to user

## user_optionsテーブル

|  Column         | Type   | Options                                          |
| ----------------| ------ | ------------------------------------------------ |
| menu_time_id    | integer| default: 0                                       |
| menu_id         | integer| null: false, foreign_key: true, default: 0       |
| user_id         | integer| null: false, foreign_key: true                   | 

### Association

- belongs_to :menu
- belongs_to :user

## menusテーブル

|  Column             | Type   | Options                       |
| ------------------- | ------ | ----------------------------- |
| menu_name           | string | null: false                   |
| price               | integer| null: false                   |
| customer_type_id    | integer| null: false                   |
| menu_text           | text   | null: false                   |
| menu_time_id        | integer| null: false                   |

### Association

- has_many :style_category_twos, dependent: :destroy
- has_many :stylist_category_lists, through:style_category_twos
- has_many :reservations
- has_many :user_options

## style_category_twosテーブル

|  Column                | Type   | Options                       |
| ---------------------- | ------ | ----------------------------- |
| menu_id                | integer| null: false, foreign_key: true|
| style_category_list_id | integer| null: false  foreign_key: true|

### Association

- belongs_to :menu
- belongs_to :style_category_list

## style_category_listsテーブル

|  Column                | Type   | Options                       |
| ---------------------- | ------ | ----------------------------- |
| name                   | string | null: false                   |

### Association

- has_many :style_category_twos
- has_many :menus, through: :style_category_twos

## adminsテーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| email               | string       | null: false                   |
| password            | string       | null: false                   |
| name                | string       | null: false                   |


## stylists テーブル

|  Column                | Type         | Options                       |
| ---------------------- | ------------ | ----------------------------- |
| stylist_first_name     | string       | null: false                   |
| stylist_lsat_name      | string       | null: false                   |
| stylist_first_name_cana| string       | null: false                   |
| stylist_last_name_can  | string       | null: false                   |
| rank_id                | integer      | null: false                   |
| gender_id              | integer      | null: false                   |
| catchphrase            | string       | null: false                   |
| self-introduction      | string       | null: false                   |
| stylist_number         | integer      | null: false                   |

### Association

- has_many :reservations
- has_many :users
- has_one  :stylist_detail

## stylist_details テーブル

|  Column                | Type         | Options                       |
| ---------------------- | ------------ | ----------------------------- |
| rank_text              | string       |                               |
| stylist_history_id     | integer      | null: false                   |
| nomination_id          | integer      | null: false                   |
| nomination_price       | integer      | null: false                   |
| style_type_id          | integer      | null: false                   |
| style_technique        | text         |                               |
| hobby                  | text         |                               |
| stylist_id             | integer      | null: false, foreign_key: true|

### Association
- belongs_to :stylist

##  reservationsテーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| stylist_id          | integer      | null: false, foreign_key: true|
| seat_id             | integer      |                               |
| time                | time         | null: false                   |
| date                | date         | null: false                   |
| menu_id             | integer      | null: false, foreign_key: true|
| user_id             | integer      | null: false  foreign_key: true|
| salon_id            | integer      | null: false  foreign_key: true|
| status_id           | integer      |                               |
| menu_start_time     | time         | null: false                   |
| menu_end_time       | time         | null: false                   |
| set_price           | integer      | null: false                   |

### Association

- belongs_to :stylist
- belongs_to :user
- belongs_to :menu
- belongs_to :salon

## seatテーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| start_time          | time         | null: false                   |
| end_time            | time         | null: false                   |
| holiday             | date         |                               |
