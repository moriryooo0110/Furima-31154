
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
- has_many :item_purchases
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
|price                  |integer          |null: false                    |
|user                   |references       |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one  :item_purchase
- has_many :comments


## item_purchases

|Column                 |Type              |Options                        |
|-----------------------|------------------|-------------------------------|
|user                   |references        |null: false, foreign_key: true |
|item                   |references        |null: false, foreign_key: true |


### Association
- has_one :address


## addresses

|Column                 |Type              |Options                        |
|-----------------------|------------------|-------------------------------|
|postal_code            |string            |null: false                    |
|prefecture_id          |integer           |null: false                    |
|municipality           |string            |null: false                    |
|address                |string            |null: false                    |
|building_name          |string            |                               |
|phone_number           |string            |null: false                    |
|transaction            |references        |null: false, foreign_key: true |


### Association
- belongs_to :item_purchase


## comments

|Column                 |Type           |Options                          |
|-----------------------|---------------|---------------------------------|
|user                   |reference       |null: false, foreign_key: true |
|item                   |reference       |null: false, foreign_key: true |
|text                   |text            |null: false


### Association
- has_many :users
- has_many :items