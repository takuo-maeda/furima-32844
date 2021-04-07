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

##users table
|Column                     |Type      |Options                   |
|---------------------------|----------|--------------------------|
|first_name                 |string    |null: false               |
|last_name                  |string    |null: false               |
|first_name_pron            |string    |null: false               |
|last_name_pron             |string    |null: false               |
|email                      |string    |null: false, unique: true |
|postal__code               |string    |null: false               |
|birthday                   |date      |                          |

#Association
has_many :items


##buyers table
|Column                 |Type    |Options                             |
|-----------------------|------------|--------------------------------|
|b_prefecture           |text        |null: false                     |
|b_ward                 |text        |null: false                     |
|b_town                 |text        |null: false                     |
|b_address              |text        |null: false                     |
|b_building             |text        |                                |
|b_postal_code          |string      |null: false                     |
|b_phone_number         |string      |null: false                     |

#Association
has_many :items

##items table
|Column                   |Type       |Options                  |
|-------------------------|-----------|-------------------------------|
|item_name                |string     |null: false                    |
|use_of_year              |string     |null: false                    |
|status_id                |string     |null: false                    |
|prefecture               |integer    |null: false                    |
|delivery_fee             |integer    |null: false                    |
|delivery_fee_payment_id  |integer    |null: false                    |
|delivery_prepare_id      |integer    |null: false                    |
|user                     |references |null: false, foreign_key: true |

#Association
 belongs_to :user
 belongs_to :purchases


##purchases
Column             |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user              |references |null: false, foreign_key: true |
|item              |references |null: false, foreign_key: true |

#Association
belongs_to :user
belongs_to :item