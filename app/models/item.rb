class Item < ApplicationRecord
  has_one_attached :image

  validates :product_name,    presence: true
  validates :detail,          presence: true
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :delivery_fee_id, presence: true
  validates :prefectures_id,  presence: true
  validates :days_id,         presence: true
  validates :price,           presence: true,
                              numericality: greater_than: 300,
                              numericality: less_than_or_equal_to: 9999999
end