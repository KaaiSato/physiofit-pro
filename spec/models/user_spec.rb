require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'samplemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが8文字以上でなければ登録できない' do
        @user.password = '1a2b3c'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'ageが空では登録できない' do
        @user.age = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end

      it 'ageが0未満では登録できない' do
        @user.age = -1
        @user.valid?
        expect(@user.errors.full_messages).to include('Age must be greater than or equal to 0')
      end

      it 'gender_idが空では登録できない' do
        @user.gender_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @user.prefecture_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it 'profileが空では登録できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
    end
  end
end
