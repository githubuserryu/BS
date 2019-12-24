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
|id|integer|null: false|
|name|string|null: false, unique: true|
|password|variant|null: false, unique: true|
|mail|variant|null: false, unique: true|

### Association
- has_many :income_lists
- has_many :send_lists

## income_listsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|icome|integer|null: false|
|day|date|null: false|
|content|string||

### Association
- belong_to :user
- belong_to :month


## spend_listsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|spend|integer|null: false|
|day|date|null: false|
|use|string||

### Association
- belong_to :user
- belong_to :month

## monthsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|sum|integer||

### Association
- has_many :income_list
- has_many :send_lists
