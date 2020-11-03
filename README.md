
## users

|Column             |Type           |Options             |
|-------------------|---------------|--------------------|
|nickname           |string         |null: false         |
|email              |string         |null: false         |
|encrypted_password |string         |null: false         |
|first_name         |string         |null: false         |
|last_name          |string         |null: false         |
|first_name_kana    |string         |null: false         |
|last_name_kana     |string         |null: false         |
|birthday           |date           |null: false         |


### Association
- has_many :items
- has_many :transactions
- has_many :comments


## items

|Column                 |Type             |Options                        |
|-----------------------|-----------------|-------------------------------|
|product_name           |string           |null: false                    |
|description_of_item    |text             |null: false                    |
|category_id            |integer          |null: false                    |
|product_status_id      |integer          |null: false                    |
|shipping_fee_burden_id |integer          |null: false                    |
|shipment_source_id     |integer          |null: false                    |
|days_to_ship_id        |integer          |null: false                    |
|price                  |string           |null: false                    |
|user                   |references       |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one  :transaction
- has_many :comments


## transactions

|Column                 |Type              |Options                        |
|-----------------------|------------------|-------------------------------|
|user                   |references        |null: false, foreign_key: true |
|items                  |references        |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses

|-----------------------|------------------|-------------------------------|
|postal_code            |string            |null: false                    |
|prefectures_id         |integer           |null: false                    |
|municipality           |string            |null: false                    |
|address                |string            |null: false                    |
|building_name          |string            |null: false                    |
|phone_number           |string            |null: false                    |
|transactions           |references        |null: false, foreign_key: true |


### Association
- belongs_to :transaction


## comments

|Column                 |Type           |Options                          |
|-----------------------|---------------|---------------------------------|
|user                   |reference       |null: false, foreign_key: true |
|items                  |reference       |null: false, foreign_key: true |
|text                   |text            |null: false


### Association
- has_many :users
- has_many :items