require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context '新規登録できる場合' do
      it '入力必須の情報が全て正しく入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが入力されていないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが入力されていないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'すでに登録されているemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'awsedrftgy'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが入力されていないと登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'asdfg'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字の混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'test1234'
        @user.password_confirmation = '1234test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが入力されていないと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが入力されていないと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが漢字・カタカナ・ひらがな以外で入力されていると登録できない' do
        @user.last_name = 'ki12こケ王'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'first_nameが漢字・カタカナ・ひらがな以外で入力されていると登録できない' do
        @user.first_name = 'ki12こケ王'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'last_name_kanaが入力されていないと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが入力されていないと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaがカタカナ以外で入力されていると登録できない' do
        @user.last_name_kana = '日るカナ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角(カタカナ)を使用してください')
      end
      it 'first_name_kanaがカタカナ以外で入力されていると登録できない' do
        @user.first_name_kana = '日るカナ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角(カタカナ)を使用してください')
      end
      it 'birth_dayが入力されていないと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
