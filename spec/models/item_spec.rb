require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '商品出品の登録'do
      context '商品出品の登録がうまくいくとき' do
        it 'nameとimage、contentとprice、categoryとstatus、paymentとprefecture、daysが存在すれば保存できる ' do
          expect(@item).to be_valid
        end
      end

      context '商品出品の登録がうまくいかないとき' do
        it '画像が空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameがからでは登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'contentが空では登録できないこと' do
          @item.content = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end

        it 'categoryが空では登録できないこと' do
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'statusが空では登録できないこと' do
          @item.status = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it 'paymentが空では登録できないこと' do
          @item.payment = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Payment can't be blank")
        end

        it 'prefectureが空では登録できないこと' do
          @item.prefecture = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'daysがからでは登録できないこと' do
          @item.days = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceの範囲が￥300〜9,999,999の間でないと登録できない'do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Price must be ¥300~9,999,999.")
        end

        it 'priceが￥9,999,999より大きければ登録できない' do
          @item.price = 100000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Price must be ¥300~9,999,999.")
        end
      end
    end
  end
end
