class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_fee_burden
  has_one_attached :image
  has_one  :item_purchase

  VALID_PRICEL_HALF = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :product_name
    validates :description_of_item
    validates :price, format: { with: VALID_PRICEL_HALF }, numericality: { only_integer: true,
                                                                           greater_than: 299, less_than: 9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :days_to_ship_id
    validates :product_status_id
    validates :shipment_source_id
    validates :shipping_fee_burden_id
  end
end
