require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end


RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  
    context 'ユーザー新規登録ができるとき' do
      it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
        # トップページへ移動する
        basic_pass root_path
        visit root_path
        #トップページにサインアップへ移動するボタンがあることを確認する
        expect(page).to have_content('新規登録')
        #新規登録ページへ移動する
        visit new_user_registration_path
        #ユーザー情報を入力する
        fill_in 'nickname', with: @user.nickname
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        fill_in 'password-confirmation', with: @user.password_confirmation
        fill_in 'last-name', with: @user.first_name
        fill_in 'first-name', with: @user.last_name
        fill_in 'last-name-kana', with: @user.first_name_prono
        fill_in 'first-name-kana', with: @user.last_name_prono
        select '1930',from: 'user_birthday_1i'
        select '12',from: 'user_birthday_2i'
        select '12',from: 'user_birthday_3i'
        #サインアップボタンを押すとユーザーモデルのカウントが１上がることを確認する
        expect{find('input[name="commit"]').click}.to change { User.count }.by(1)
        #トップページへ遷移する
        expect(current_path). to eq(root_path)
        #カーソルを合わせるとログアウトボタンがあることを確認する
        expect(page).to have_content('ログアウト')
        #サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
        expect(page).to have_no_content('新規登録')
      end
    end
    context 'ユーザー新規登録ができないとき' do
      it '謝った情報ではユーザー新規登録ができずに新規ページにもどってくる' do
        #トップページに移動する
        visit root_path
        #トップページにサインアップページへ遷移するボタンがあることを確認する
        expect(page).to have_content('新規登録')
        #新規登録ページへ移動する
        visit new_user_registration_path
        #ユーザー情報を入力する
        fill_in 'email', with: ''
        fill_in 'password', with: ''
        fill_in 'password-confirmation', with: ''
        fill_in 'last-name', with: ''
        fill_in 'first-name', with: ''
        fill_in 'last-name-kana', with: ''
        fill_in 'first-name-kana', with: ''
        select '1930',from: 'user_birthday_1i'
        select '12',from: 'user_birthday_2i'
        select '12',from: 'user_birthday_3i'
        #サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
        expect{find('input[name="commit"]').click}.to change { User.count }.by(0)
        #新規登録ページへ戻されることを確認する
        expect(current_path).to eq('/users')
      end
    end
end
