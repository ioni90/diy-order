require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'オーダー家具情報の登録' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'すべての値が正しく入力されていれば登録できる' do
      expect(@order).to be_valid
    end
    it '材質は空でも登録できる' do
      @order.material = ""
      expect(@order).to be_valid
    end
    it 'その他希望が空でも登録できる' do
      @order.detail = ""
      expect(@order).to be_valid
    end
    it '家具の名前が空だと登録できない' do
      @order.name = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Name can't be blank")
    end
    it '発注目的が空だと登録できない' do
      @order.story = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Story can't be blank")
    end
    it '家具のタイプが"--"だと登録できない' do
      @order.type_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Type must be other than 1")
    end
    it '家具サイズが空だと登録できない' do
      @order.size = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Size can't be blank")
    end
    it '制作希望日が"--"だと登録できない' do
      @order.delivery_time_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery time must be other than 1")
    end
    it '家具の価格が空だと登録できない' do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end
    it 'ユーザーが紐付いていないと家具情報は保存できない' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('User must exist')
    end
  end
end