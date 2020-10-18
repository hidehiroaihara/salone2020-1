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
# salone2020

## 概要

美容室がメインのサロンの予約サイト。管理者の美容室が美容室に来るお客様の予約管理、情報管理等出来る。  
お客様は行きたい美容室に空いてる日程を確認しながら予約できるアプリケーションです。

## 本番環境

<http://54.150.217.160/>

ログイン情報（テスト用）

- Eメール: test@gmail.com
- パスワード :test123

<http://54.150.217.160/admins/sign_in>

管理者用ログイン画面

ログイン情報

- Eメール: salone@salone.com
- パスワード: salone2020

# 制作背景（意図）

今の美容室向けの予約サイトは集客や広告メインが強く大型店舗や新規顧客を集客に力を入れてたい美容室はとても魅力的に感じると思います。  
現状美容室は約２５万件ほどあると言われております。その中でも１店舗あたりのスタイリストの人数は１.５人です。  
個人店舗の方が圧倒的に多く大型店舗方が少ない事がわかります。その中で個人店舗で安定しているお店は新規集客よりも現状お客様を大切にしたい美容室のが多いと感じています。  
私はそこで今回個人店舗向けに予約サイトを作成しました。  
個人店舗では多く集客しての売上向上より、客単価、一人一人のお客様の売上向上を目指しています。また、美容師に接して一番感じたことは商品の販売対する弱さを感じました。  
全員同じメニューを見せるのではなく、お客様のランクによる料金設定、メニュー変更を出来るようにする。お客様によっては料金が高くても満足していれば高い料金で支払っていきます。価格が上がることに敏感なお客様もいる中美容室がお客様によって表示を細かく分ければメニューの打ち出しもやりやすくなると考えました。  
商品販売に対しては、お客様はいい商品があれば興味ある人が多いにも関わらず売り込むをすることに抵抗が多い美容師が多く商品販売での売上を減らしてしまっている方が多く感じます。ネットで販売案内が厳しい美容業界ですが、美容室とお客様を紐付けた予約サイトを作ることにより、ネットでの案内が実現できると考えております。商品の予約機能を作り、お客様にももっと色々な商品を知ってもう事ができる。そして、予約制にする事ができれば美容室への在庫軽減になると考えています。
色々な美容室にお客様に選んでもうらための予約サイトではなく、個人店舗の美容師のため、１店舗に対するお客様にための予約サイトを作成しています。

# DEMO



# DB設計

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
