require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと保存できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email:@user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "1qaz2"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Complexity requirement not met. Length should be 6-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character")
    end

    it "パスワードは確認用含めて2回入力すること" do
      @user.password = "1qaz2wsx"
      @user.encrypted_password =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = "1qaz2wsx"
      @user.encrypted_password ="2wsxzaq1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = "佐藤"
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "satou"
      @user.last_name = "jirou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid","Last name is invalid")
    end

    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.first_name = "サトウ"
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = "佐藤"
      @user.last_name_kana = "じろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid","Last name kana is invalid")
    end

    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end  
end
