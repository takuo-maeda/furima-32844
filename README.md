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
|address                    |string    |                          |
|phone_number               |integer   |null: false               |
|email                      |string    |null: false, unique: true |
|postal__code               |string    |null: false               |
|age                        |integer   |                          |
|birthday                   |date      |                          |

#Association
has_many :item


##buyers table
|Column                 |Type    |Options                             |
|-----------------------|------------|--------------------------------|
|buyer_first_name       |string      |null: false                     |
|buyer_last_name        |string      |null: false                     |
|buyer_first_name_pron  |string      |null: false                     |
|buyer_first_name_pron  |string      |null: false                     |
|b_prefecture           |text        |null: false                     |
|b_ward                 |text        |null: false                     |
|b_town                 |text        |null: false                     |
|b_address              |text        |null: false                     |
|b_building             |text        |                                |
|b_postal_code          |string      |null: false                     |
|b_phone_number         |string      |null: false                     |
|b_email                |string      |null: false, unique: true       |
|b_age                  |integer     |                                |
|b_birthday             |date        |                                |

#Association
has_many :item

##items table
|Column               |Type       |Options                  |
|---------------------|-----------|-------------------------------|
|item_name            |string     |null: false                    |
|use_of_year_id       |integer    |null: false                    |
|prefecture           |integer    |null: false                    |
|delivery_fee         |text       |null: false                    |
|delivery_payment_id  |integer    |null: false                    |
|delivery_prepare_id  |integer    |null: false                    |
|name_id              |references |null: false, foreign_key: true |
|buyer_id             |references |null: false, foreign_key: true |

#Association
 belongs_to :user
 belongs_to :buyer

##owners table
Column             |Type       |Options                         |
|------------------|-----------|------------------------------- |
|owner_name        |string     |null: false                     |
|o_phone_number    |string     |null: false                     |
|o_prefecture      |text       |null: false                     |
|o_ward            |text       |null: false                     |
|o_town            |text       |null: false                     |
|o_address         |text       |null: false                     |
|o_building        |text       |                                |
|o_postal_code     |string     |null: false                     |
|buyer_id          |integer    |null: false, foreign_key: true  |

#Association
has_one :item

##purchase
Column             |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user_id          |text        |null: false, foreign_key: true |
|item_id          |text        |null: false, foreign_key: true |

#Association
belongs_to :user
belongs_to :item