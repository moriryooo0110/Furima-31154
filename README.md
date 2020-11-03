
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
|category               |collection_select|null: false                    |
|product_status         |collection_select|null: false                    |
|shipping_fee_burden    |collection_select|null: false                    |
|shipment_source        |collection_select|null: false                    |
|days_to_ship           |collection_select|null: false                    |
|price                  |string           |null: false                    |
|user                   |reference        |null: false, foreign_key: true |

### Association
- has_many :users
- has_one  :transaction
- has_many :comments


## transactions

|Column                 |Type              |Options                        |
|-----------------------|------------------|-------------------------------|
|user                   |reference         |null: false, foreign_key: true |
|items                  |reference         |null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items

## addresses

|-----------------------|------------------|-------------------------------|
|postal_code            |text              |null: false                    |
|prefectures            |collection_select |null: false                    |
|municipality           |text              |null: false                    |
|address                |text              |null: false                    |
|building_name          |text              |null: false                    |
|phone_number           |text              |null: false                    |

### Association
- belongs_to :users
- belongs_to :items


## comments

|Column                 |Type           |Options                          |
|-----------------------|---------------|---------------------------------|
|user                   |reference       |null: false, foreign_key: true |
|items                  |reference       |null: false, foreign_key: true |
|text                   |text            |null: false


### Association
- has_many :users
- has_many :items