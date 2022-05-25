require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birth_day が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
     
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password must include both single-byte alphanumerical characters")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')      
      end

      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password must include both single-byte alphanumerical characters')      
      end
    
      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password must include both single-byte alphanumerical characters')      
      end
    
      it 'passwordが全角文字を含むパスワードでは登録できない' do
        @user.password = '111あaa'
        @user.password_confirmation = '111あaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password must include both single-byte alphanumerical characters')      
      end
    
    
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'last_nameが半角では登録できない' do
          @user.last_name = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name Please enter in full-width.")
        end

        it 'first_nameが半角では登録できない' do
          @user.first_name = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Please enter in full-width.")
        end

          it 'first_name_kanaが空では登録できない' do
            @user.first_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end
          it 'last_name_kanaが空では登録できない' do
            @user.last_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana is must NOT contain any other characters than alphanumerics.")
          end

        it 'last_name_kanaが漢字では登録できない' do
          @user.last_name_kana = '漢字'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is must NOT contain any other characters than alphanumerics.")
        end

        it 'first_name_kanaが漢字では登録できない' do
          @user.first_name_kana = '漢字'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is must NOT contain any other characters than alphanumerics.")
        end

        it "birth_dayが空では登録できない" do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
    end
  end
end
