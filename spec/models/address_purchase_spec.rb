
RSpec.describe AddressPurchase, type: :model do
  describe '商品購入テスト' do
    before do
      @address_purchase = FactoryBot.build(:address_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it '郵便番号が空だと保存できないこと' do
      @address_purchase.postal_code = ''
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンを挟まないと登録できない' do
    end
    it '市町村は空だと登録できない' do
    end
    it '市町村は全角ひらがな・全角カタカナ・漢字以外で入力できない' do
    end
    it '電話番号は空では登録できない' do
    end
    it '電話番号は半角数値で入力以外で入力できない' do
    end
    it '都道府県はきちんと選択すること' do
    end
  end
end