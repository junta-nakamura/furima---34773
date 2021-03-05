class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :day
  
  has_one_attached :image
  
  validates :image,           presence: true
  validates :product_name,    presence: true
  validates :detail,          presence: true
  validates :category_id,     presence: true  
  validates :status_id,       presence: true
  validates :delivery_fee_id, presence: true
  validates :prefectures_id,  presence: true
  validates :days_id,         presence: true
  validates :price,           presence: true
  validates :price,           numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  PRICE_REGEX = /\A[0-9]+\z/
  validates_format_of :price, with: PRICE_REGEX, message: "Half-width number"

end
  # with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  #   validates :price
  # end

  # with_options presence: true,
  #              numericality: {greater_than_or_equal_to: 300},
  #              numericality: {less_than_or_equal_to: 9999999},
  #              format: { with: /\A[0-9]+\z/ } do
  #   validates :price, message: 'Half-width number'
  # end




