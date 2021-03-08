require 'rails_helper'

RSpec.describe AddressDeal, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @address_deal = FactoryBot.build(:address_deal, user_id: @user, item_id: @item)
    end
    
    it '必要な情報を正しく入力すると購入できる' do
      expect(@address_deal).to be_valid
    end
  
    it '郵便番号が空では購入できない' do
      @address_deal.postal_code = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Postal code can't be blank")
    end
  
    it '都道府県名が空では購入できない' do
      @address_deal.prefecture_id = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it '市町村名が空では購入できない' do
      @address_deal.municipalities = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Municipalities can't be blank")
    end
  
    it '電話番号が空では購入できない' do
      @address_deal.phone = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号が半角数字でないと購入できない' do
      @address_deal.phone = "０１２３４５６７８９"
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Phone Input only number")
    end

    it '電話番号が半角数字のみでないと購入できない' do
      @address_deal.phone = "０１２３４56789"
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Phone Input only number")
    end
  
    it 'トークンが空では購入できない' do
      @address_deal.token = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Token can't be blank")
    end
  
    it '郵便番号にはハイフンがないと購入できない' do
      @address_deal.postal_code = "1234567"
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Postal code Input correctly")
    end
  
    it '電話番号は10桁未満の数値では購入できない' do
      @address_deal.phone = "123456789"
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Phone Input only number")
    end
  
    it '電話番号は11桁を超える数値では購入できない' do
      @address_deal.phone = "012345678910"
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Phone Input only number")
    end

    it '建物名の記述がなくても購入できる' do
      @address_deal.building = ""
      expect(@address_deal).to be_valid 
    end

    it 'user_idが空では購入できない' do
      @address_deal.user_id = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では購入できない' do
      @address_deal.item_id = ""
      @address_deal.valid?
      expect(@address_deal.errors.full_messages).to include("Item can't be blank")
    end

  end
end
