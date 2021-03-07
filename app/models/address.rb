class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    belongs_to :deal
      
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :phone
    validates :deal
  end

  # PRICE_REGEX = /\A[0-9]+\z/
  # validates_format_of :price, with: PRICE_REGEX, message: "Half-width number"

end
