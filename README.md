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
|Column         |Type      |Options     |
|---------------|----------|------------|
|user           
|string    |null: false |
|pronunciation  |string    |            |
|address        |string    |            |
|phone_number   |integer   |null: false |
|email          |string    |null: false |
|postal__code   |string    |null: false |
|age            |integer   |            |
|birthday       |datetime  |            |

#Association
has_many :item


##buyers table
|Column           |Type    |Options     |
|-----------------|--------|------------|
|buyername        |string  |null: false |
|b_pronunciation  |string  |            |
|b_address        |string  |            |
|b_phone_number   |text    |null: false |
|b_email          |text    |null: false |
|b_postal_code    |text    |null: false |
|b_age            |text    |            |
|b_birthday       |text    |            |

#Association
has_many :item

##items table
|Column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|item_name         |string     |null: false               |
|use_of_years      |integer    |numll: false              |
|prefecture        |text       |numll: false              |
|delivery_fee      |text       |numll: false              |
|delivery_payment  |text       |numll: false              |
|image             |           |                          |
|name_id           |references |numll: false, foregin_key |
|buyser_id         |references |numll: false, foregin_key |

#Association
 belongs_to :user
 belongs_to :buyer

##owners table
Column             |Type       |Options                   |
|------------------|-----------|--------------------------|
|owner_name        |string     |null: false               |
|o_phone_number    |integer    |numll: false              |
|o_address         |text       |numll: false              |
|o_postal_code     |text       |numll: false              |

has_one :item