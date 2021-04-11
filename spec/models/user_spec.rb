require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nameの値が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  end
end
# RSpec.describe User, type: :model do
  # describe 'ユーザー新気登録' do
  #   #バリデーションのチェック
  #   it "ニックネームが空では登録できない" do
  #           user = User.new(nickname: nil)
  #           user.valid?
  #           expect(user.errors[:nickname]).to_not include("Nickname can't be blank")
  #       end
  #       it "emailが空では登録できない" do
  #         user = User.new(email: nil)
  #         user.valid?
  #         expect(user.errors[:email]).to_not include("Email can't be blank")
  #       end
  #       it "passwordが空では登録できない" do
  #         user = User.new(encrypted_password: nil)
  #         user.valid?
  #         expect(user.errors[:encrypted_password]).to_not include("Encrypted password can't be blank")
  #       end
  #       it "first_nameが空では登録できない" do
  #         user = User.new(first_name: nil)
  #         user.valid?
  #         expect(user.errors[:first_name]).to_not include("First name can't be blank")
  #       end
  #       it "last_nameが空では登録できない" do
  #         user = User.new(last_name: nil)
  #         user.valid?
  #         expect(user.errors[:last_name]).to_not include("Last name can't be blank")
  #       end
  #       it "first_name_pronoが空では登録できない" do
  #         user = User.new(first_name_prono: nil)
  #         user.valid?
  #         expect(user.errors[:first_name_prono]).to_not include("First name prono can't be blank")
  #       end
  #       it "last_name_pronoが空では登録できない" do
  #         user = User.new(last_name_prono: nil)
  #         user.valid?
  #         expect(user.errors[:last_name_prono]).to_not include("Last name prono can't be blank")
  #       end
  #       it "birthdayが空では登録できない" do
  #         user = User.new(birthday: nil)
  #         user.valid?
  #         expect(user.errors[:birthday]).to_not include("Birthday can't be blank")
  #         # binding.pry
  #       end
  # end
# end
