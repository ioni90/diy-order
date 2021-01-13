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
      expect(@order.errors.full_messages).to include("家具の名前を入力してください")
    end
    it '発注目的が空だと登録できない' do
      @order.story = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("家具発注目的を入力してください")
    end
    it '家具のタイプが"--"だと登録できない' do
      @order.type_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("家具のタイプが選択されていません")
    end
    it '家具サイズが空だと登録できない' do
      @order.size = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("家具のサイズを入力してください")
    end
    it '制作希望日が"--"だと登録できない' do
      @order.delivery_time_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("制作希望日数が選択されていません")
    end
    it '家具の価格が空だと登録できない' do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("支払い価格を入力してください", "支払い価格は数値で入力してください")
    end
    it 'ユーザーが紐付いていないと家具情報は保存できない' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Userを入力してください')
    end
  end
end