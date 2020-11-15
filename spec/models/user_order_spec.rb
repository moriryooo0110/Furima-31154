require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入機能' do
    context '商品の購入がうまくいくとき' do
      it '「建物名」が空でも購入出来る事' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")


      end

      it "郵便番号が空では購入できないこと" do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "郵便番号に-が無いとでは購入できないこと" do
        @user_order.postal_code = 1234567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "郵便番号が11桁以上だと購入できないこと" do
        @user_order.postal_code = 123-456799
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県が空だと購入できないこと" do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture is not a number")
      end

      it "都道府県選択時(--)を選択した場合購入できないこと" do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "市町村区が空だと購入出来ないこと" do
        @user_order.municipality = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "番地が空だと購入出来ないこと" do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空だと購入出来ないこと" do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号が11桁では無いと購入出来ないこと" do
        @user_order.phone_number = "0123456789101"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end
   end
  end
end
