class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :product_status
  belongs_to :shipment_source
  belongs_to :shipping_fee_burden
  has_one_attached :image


  with_options presence: true do
    validates :product_name
    validates :description_of_item
    validates :price
    validates :content, unless: :wasattached?
  end


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :days_to_ship_id
    validates :product_status
    validates :shipment_source
    validates :shipping_fee_burden
  end
end
