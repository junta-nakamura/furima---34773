require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目に正しく情報が入力され、パスワードは英数字を含むものであれば登録ができる' do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@を含まないと登録できない' do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'emailの重複登録はできない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは6文字未満だと登録できない' do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordは半角英語のみでは登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordは半角数字のみでは登録できない' do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordは全角では登録できない' do
      @user.password = "ａａａＡＡＡ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが一致していないと登録できない' do
      @user.password = "aaa111"
      @user.password_confirmation = "qqq111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    # 漢字氏名
    it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it 'first_name_kanijが空では登録できない' do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end 
    
    it 'last_name_kanjiに漢字・ひらがな・カタカナ以外の文字が入力されては登録できない' do
      @user.last_name_kanji = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
    end
    
    it 'first_name_kanjiに漢字・ひらがな・カタカナ以外の文字が入力されては登録できない' do
      @user.first_name_kanji = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end


    # カナ氏名
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaに全角カタカナ以外の文字列が入力されては登録できない' do
      @user.last_name_kana = "katakana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaに全角カタカナ以外の文字列が入力されては登録できない' do
      @user.first_name_kana = "katakana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
