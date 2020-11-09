require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の新規登録' do
    context '出品登録がうまくいくとき' do
      it '全ての項目が存在すれば登録出来る事' do
        expect(@item).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.description_of_item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it '選択カテゴリーの情報が(--)だと登録出来ない事' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態についての情報が必須であること' do
        @item.product_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Product status is not a number')
      end

      it '選択した商品状態の情報が(--)だと登録出来ない事' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product status must be other than 1')
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_fee_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee burden is not a number')
      end

      it '選択した配送料の負担についての情報が(--)だと登録出来ない事' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee burden must be other than 1')
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipment_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source is not a number')
      end

      it '選択した発送元の地域についての情報が(--)だと登録出来ない事' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end

      it '発送までの日数についての情報が必須であること' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship is not a number')
      end

      it '発送までの日数についての情報が(--)だと登録出来ない事' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end

      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
