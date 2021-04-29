require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '商品購入テスト' do
    before do
      @address_purchase = FactoryBot.build(:address_purchase)
    end
    
    context '登録できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_purchase).to be_valid
      end
      it '建物名はなくても他の値が全て正しく入力されていれば保存できること' do
        @address_purchase.building = ''
        expect(@address_purchase).to be_valid
      end
    end

    context '登録できない時' do
      it '郵便番号が空だと保存できないこと' do
        @address_purchase.postal_code = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフンを挟まないと登録できない' do
          @address_purchase.postal_code = Faker::Lorem.characters(number: 7, min_numeric: 7) 
          @address_purchase.valid?
          expect(@address_purchase.errors.full_messages).to include("Postal code は登録できませんでした。ハイフン-(半角)を含みます。")
      end
      it '市町村は空だと登録できない' do
        @address_purchase.town = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Town can't be blank")
      end
      it '市町村は全角ひらがな・全角カタカナ・漢字以外で入力できない' do
        @address_purchase.town = Faker::Lorem.characters(number: 7, min_alpha: 3, min_numeric: 1) 
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Town は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it '電話番号は空では登録できない' do
        @address_purchase.phone_number = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number は半角数値で入力して下さい")
      end
      it '電話番号は半角数値で入力以外で入力できない' do
        @address_purchase.phone_number = Faker::Lorem.characters(number: 11, min_alpha: 11) 
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number は半角数値で入力して下さい")
      end
      it '都道府県はきちんと選択すること' do
        @address_purchase.prefecture_id = 1
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
    end
  end
end