require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録の保存' do
    context '新規登録がうまく行く時' do
      it "全ての工程どうりに登録する" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと保存できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと保存できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailがあると保存できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@がないと保存できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと保存できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5以下だと保存できない" do
        @user.password = "0000a"
        @user.password_confirmation = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英語だけでは保存できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください。")
      end
      it "passwordが半角数字だけでは保存できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください。")
      end
      it "passwordが全角の場合は保存できない" do
        @user.password = "ＡＡＡＡＡＡ"
        @user.password_confirmation = "ＡＡＡＡＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password 半角英数字混合で入力してください。")
      end
      it "passwordとpassword_confirmationが不一致だと保存できない" do
        @user.password = "000000a"
        @user.password = "000000b"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと保存できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角(漢字・ひらがな・カタカナ)以外は保存できない" do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）で入力してください。")
      end
      it "last_nameが空だと保存できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameは全角(漢字・ひらがな・カタカナ)以外は保存できない" do
        @user.last_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）で入力してください。")
      end
      it "first_name_readingは空だと保存できない" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("first name reading can't be blank")
      end
      it "first_name_readingは全角(カタカナ)以外は保存できない" do
        @user.first_name_reading = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角カタカナで入力する。")
      end
      it "last_name_readingは空だと保存できない" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "last_name_readingは全角(カタカナ)以外は保存できない" do
        @user.last_name_reading = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角カタカナで入力する。")
      end
      it "birth_dayは空だと保存できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end