require 'rails_helper'

RSpec.describe Item, type: :model do
    describe '#create' do
      before do
        @item = FactoryBot.build(:item)
        @item.image = fixture_file_upload("/20210327-085606.png")
      end

      it 'image,item_name,description,category_id,status_id,prefecture_id,delivery_fee_payment_id,delivery_prepare_id,priceの値が存在すれば登録できること' do
        expect(@item).to be_valid
        expect(@item.image).to be_valid
      end

      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'catego_idが空では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが空では登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'delivery_fee_payment_idが空では登録できないこと' do
        @item.delivery_fee_payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee payment must be other than 1")
      end

      it 'delivery_prepare_idが空では登録できないこと' do
        @item.delivery_prepare_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prepare must be other than 1")
      end

      it 'prefecture_idが空では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥0~¥299円では登録できない' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格の範囲が、¥9,999,999円以上だと登録できない' do
        @item.price = Faker::Number.between(from: 99999999, to: 100000000000)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceは全角カナでは登録できないこと' do
        require 'nkf'
        @item.price = Gimei.first.katakana
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
end
