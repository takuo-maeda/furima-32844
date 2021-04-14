require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickame,email,password,password_comfirmation,first_name,last_name,first_name_prono,last_name_prono,birthdayの値が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'paswordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password", "Password は半角英数で入力して下さい")
    end

    it 'paswordが文字数５文字では登録できないこと' do
      @user.password = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1) 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'pasword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation は半角英数で入力して下さい")
    end

    it 'pasword_confirmationが文字数５文字では登録できないこと' do
      @user.password_confirmation = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1) 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが半角では登録できないこと' do
      @user.first_name = Faker::Alphanumeric.alphanumeric(number: 4)
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end

    it 'last_nameが半角では登録できないこと' do
      @user.last_name = Faker::Alphanumeric.alphanumeric(number: 4)
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end

    it 'first_name_pronoが空では登録できないこと' do
      @user.first_name_prono = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name prono can't be blank")
    end
 
    it 'first_name_pronoが半角では登録できないこと' do
      require 'nkf'
      first_half_kana = Gimei.first.katakana
      @user.first_name_prono = NKF.nkf('-w -Z4 -x', first_half_kana)
      @user.valid?
      expect(@user.errors.full_messages).to include("First name prono は全角カタカナで入力して下さい")
    end

    it 'last_name_pronoが半角では登録できないこと' do
      require 'nkf'
      last_half_kana = Gimei.last.katakana
      @user.first_name_prono = NKF.nkf('-w -Z4 -x', last_half_kana)
      @user.last_name_prono = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name prono は全角カタカナで入力して下さい")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

