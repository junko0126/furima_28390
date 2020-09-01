require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存ができること' do
      expect(@order_address).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end
    it 'phoneが空だと保存できないこと' do
      @order_address.phone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが11桁以上だと保存できないこと' do
      @order_address.phone = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone is invalid. Maxmam 11')
    end
  end
end
