require 'rails_helper'

RSpec.describe Trainer, type: :model do
  before do
    @trainer = FactoryBot.build(:trainer)
  end

  describe 'トレーナー新規登録' do
    context '新規登録できる場合' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@trainer).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @trainer.nickname = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @trainer.email = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @trainer.password = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが8文字以上でなければ登録できない' do
        @trainer.password = '1a2b3c'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが英字のみでは登録できない' do
        @trainer.password = 'abcdefgh'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できない' do
        @trainer.password = '12345678'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Password is invalid')
      end

      it 'last_nameが空では登録できない' do
        @trainer.last_name = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @trainer.first_name = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_readingが空では登録できない' do
        @trainer.last_name_reading = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Last name reading can't be blank")
      end

      it 'first_name_readingが空では登録できない' do
        @trainer.first_name_reading = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("First name reading can't be blank")
      end

      it 'ageが空では登録できない' do
        @trainer.age = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Age can't be blank")
      end

      it 'ageが0未満では登録できない' do
        @trainer.age = -1
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Age must be greater than or equal to 0')
      end

      it 'gender_idが空では登録できない' do
        @trainer.gender_id = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Gender can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @trainer.prefecture_id = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @trainer.city = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("City can't be blank")
      end

      it 'registration_numberが6桁の数字でないと登録できない' do
        @trainer.registration_number = '1234'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Registration number is invalid')
      end

      it 'careerが空では登録できない' do
        @trainer.career = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Career can't be blank")
      end

      it 'profileが空では登録できない' do
        @trainer.profile = ''
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include("Profile can't be blank")
      end

     context '名前のフォーマットが正しくない場合' do
      it 'last_nameが全角文字(漢字、ひらがな、カタカナ)以外の場合、登録できない' do
        @trainer.last_name = 'Yamada123'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Last name is invalid')
      end
  
       it 'first_nameが全角文字(漢字、ひらがな、カタカナ)以外の場合、登録できない' do
        @trainer.first_name = 'Taro123'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('First name is invalid')
       end
  
       it 'last_name_readingが全角ひらがな以外の場合、登録できない' do
        @trainer.last_name_reading = 'ヤマダ'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('Last name reading is invalid')
       end
  
       it 'first_name_readingが全角ひらがな以外の場合、登録できない' do
        @trainer.first_name_reading = 'タロウ'
        @trainer.valid?
        expect(@trainer.errors.full_messages).to include('First name reading is invalid')
       end
      end
    end
  end
end
