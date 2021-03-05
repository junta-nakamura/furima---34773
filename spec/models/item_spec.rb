require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '必要な情報を正しく入力すると出品できる' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚添付しないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@image.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では出品できない' do
      @item.product_name = ""
      @item.valid?
      expect(@image.errors.full_messages).to include("Product name can't be blank")
    end

    it '商品説明が空では出品できない' do
      @item.detail = ""
      @item.valid?
      expect(@image.errors.full_messages).to include("Detail can't be blank")
    end

    it '商品状態が空では出品できない' do
      @item.status_id = ""
      @item.valid?
      expect(@image.errors.full_messages).to include("Status an't be blank")
    end

    it '配送料が空では出品できない' do
      @item.delivery_fee_id = ""
      @item.valid?
      expect(@image.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送元の地域が空では出品できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@image.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '発送までの日数が空では出品できない' do
      @item.day_id = ""
      @item.valid?
      expect(@image.errors.full_messages).to include("Days can't be blank")
    end

    it '販売価格が空では出品できない' do
      @item.price_id = 0
      @item.valid?
      expect(@image.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格は¥300未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@image.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格は¥9,999,999を超えては出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@image.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '商品価格は半角数字でないと出品できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@image.errors.full_messages).to include("Price is not a number")
    end

end
