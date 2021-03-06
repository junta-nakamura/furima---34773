class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :delivery_day
    
    belongs_to :user
    has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :detail
    validates :category_id  
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  PRICE_REGEX = /\A[0-9]+\z/
  validates_format_of :price, with: PRICE_REGEX, message: "Half-width number"

  
end
