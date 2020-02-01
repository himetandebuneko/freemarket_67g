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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastnamekana|string|null: false|
|firstnamekana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :todos, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :news, dependent: :destroy
- has_many :credits, dependent: :destroy
- has_many :addresses, dependent: :destroy


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|detail|string|null: false, index: true|
|size|string|null: false|
|price|integer|null: false|
|status|string|null: false|
|condition|string|null: false|
|shippingadress|string|null: false|
|shippingdate|string|null: false|
|payer|string|null: false|
|user|reference|null: false, foreign_key: true|
|category|reference|null: false, foreign_key: true|

### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :images, dependent: :destroy
- belongs_to :user
- belongs_to :category
- has_one :delivery
- has_one :todo


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|reference|null:false, foreign_key: true|
|product|reference|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## todosテーブル

|Column|Type|Options|
|------|----|-------|
|status|string|
|user|reference|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :product


## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|shipping|string|null: false|
|daytime|datetime|null: false|
|shippingfee|integer|null: false|
|shippingcondition|string|null: false|
|user|reference|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :product


## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiredate|date|null: false|
|securitycode|integer|null: false|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user


## newsテーブル
|Column|Type|Options|
|------|----|-------|
|news|string|
|user|reference|null: false, foreign_key: true|


### Association
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :products


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|reference|null: false, foreign_key: true|

### Association
- belogns_to :product


## addressテーブル
|postcode|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|housenumber|string|null: false|
|housename|string|
|phonenumber|integer|unique: true|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user