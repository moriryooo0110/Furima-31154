
## users

|Column         |Type           |Options             |
|---------------|---------------|--------------------|
|nickname       |string         |null: false         |
|email          |string         |null: false         |
|password       |string         |null: false         |
|名前（全角）     |text           |null: false         |
|名前（カナ）     |text           |null: false         |
|生年月日        |text           |null: false         |


### Association
- has_many :items
- has_many :transactions
- has_many :comments


## items

|Column         |Type           |Options                        |
|---------------|---------------|-------------------------------|
|商品名          |text           |null: false                    |
|商品説明        |text           |null: false                    |
|商品状態        |text           |null: false                    |
|配送料の負担     |text           |null: false                    |
|発送元の地域     |text           |null: false                    |
|発送までの日数    |text           |null: false                    |
|購入価格         |text           |null: false                    |
|userid         |reference型     |null: false, foreign_key: true |

### Association
- has_many :users
- has_one  :transactions
- has_many :comments


## transactions

|Column                 |Type           |Options                          |
|-----------------------|---------------|---------------------------------|
|クレジットカード情報       |integer        |null: false                     |
|郵便番号                 |text           |null: false                     |
|都道府県                 |text           |null: false                     |
|市区町村                 |text           |null: false                     |
|番地                    |text           |null: false                     |
|建物名                  |text            |null: false                    |
|電話番号                |text            |null: false                    |
|userid                 |reference       |null: false, foreign_key: true |
|itemsid                |reference       |null: false, foreign_key: true |

### Association
- has_many :users
- has_one  :items


## comments

|Column                 |Type           |Options                          |
|-----------------------|---------------|---------------------------------|
|userid                 |reference       |null: false, foreign_key: true |
|itemsid                |reference       |null: false, foreign_key: true |
|text                   |text            |null: false


### Association
- has_many :users
- has_many :items