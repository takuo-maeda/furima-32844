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
|nickname                   |string    |null: false               |
|email                      |string    |null: false, unique: true |
|encrypted_password         |string    |null: false               |
|first_name                 |string    |null: false               |
|last_name                  |string    |null: false               |
|first_name_pron            |string    |null: false               |
|last_name_pron             |string    |null: false               |
|birthday                   |date      |null: false               |

#Association
has_many :items
has_many :purchases

##addresses table
|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
|postal_code          |string      |null: false                     |
|prefecture_id        |integer     |null: false                     |
|town                 |string      |null: false                     |
|address              |string      |null: false                     |
|building             |string      |                                |
|phone_number         |string      |null: false                     |
|purchase             |references  |null: false, foreign_key: true  |

#Association
belongs_to :purchase

##items table
|Column                   |Type       |Options                        |
|-------------------------|-----------|-------------------------------|
|item_name                |string     |null: false                    |
|description              |text       |null: false                    |
|category_id              |integer    |null: false                    |
|status_id                |integer    |null: false                    |
|delivery_fee_payment_id  |integer    |null: false                    |
|prefecture_id            |integer    |null: false                    |
|delivery_prepare_id      |integer    |null: false                    |
|price                    |integer    |null: false                    |
|user                     |references |null: false, foreign_key: true |

#Association
 belongs_to :user
 has_one :purchase


##purchases
Column             |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user              |references |null: false, foreign_key: true |
|item              |references |null: false, foreign_key: true |

#Association
belongs_to :user
belongs_to :item
belongs_to :address
