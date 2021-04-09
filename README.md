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
|nickname                   |string    |null: false               |
|password                   |string    |null: false               |
|email                      |string    |null: false, unique: true |
|birthday                   |date      |null: false               |

#Association
has_many :items
has_many :purchases

##addresses table
|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
|prefecture_id        |integer     |null: false                     |
|ward                 |integer     |null: false                     |
|town                 |integer     |null: false                     |
|address              |integer     |null: false                     |
|building             |integer     |                                |
|postal_code          |string      |null: false                     |
|phone_number         |string      |null: false                     |

#Association
has_one :items

##items table
|Column                   |Type       |Options                  |
|-------------------------|-----------|-------------------------------|
|item_name                |string     |null: false                    |
|use_of_year              |string     |null: false                    |
|status_id                |string     |null: false                    |
|prefecture_id            |integer    |null: false                    |
|delivery_fee_id          |integer    |null: false                    |
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