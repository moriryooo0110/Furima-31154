class Order < ApplicationRecord
  has_one :address
  has_one :item_purchase
  
end
