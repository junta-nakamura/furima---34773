class AddressDeal
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number,
                :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :prefecture_id, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 47}
    validates :municipalities
    validates :house_number
    validates :phone
    validates :user_id
    validates :item_id
  end

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX, message: "Input correctly"
  
  PHONE_REGEX = /\A\d{10,11}\z/
  validates_format_of :phone, with: PHONE_REGEX, message: "Input only number"

  def save
    deal = Deal.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                   house_number: house_number, building: building, phone: phone, deal_id: deal.id)
  end

end
