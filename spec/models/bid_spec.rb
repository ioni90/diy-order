require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe 'DIY希望条件の登録' do
    before do
      @bid = FactoryBot.build(:bid)
    end

    it 'すべての値が正しく入力されていれば登録できる' do
      expect(@bid).to be_valid
    end
    it 'オファー価格は空でも登録できる' do
      @bid.offer_price = ""
      expect(@bid).to be_valid
    end

    it 'サイズのコメントが空だと登録できない' do
      @bid.size_remark = ""
      @bid.valid?
      expect(@bid.errors.full_messages).to include("サイズへの返信を入力してください")
    end
    it '材質のコメントが空だと登録できない' do
      @bid.material_remark = nil
      @bid.valid?
      expect(@bid.errors.full_messages).to include("材質への返信を入力してください")
    end
    it '詳細のコメントが空だと登録できない' do
      @bid.detail_remark = nil
      @bid.valid?
      expect(@bid.errors.full_messages).to include("詳細への返信を入力してください")
    end
    it '希望制作日数のコメントが空だと登録できない' do
      @bid.delivery_time_remark = nil
      @bid.valid?
      expect(@bid.errors.full_messages).to include("制作日数への返信を入力してください")
    end
    it '希望制作価格のコメントが空だと登録できない' do
      @bid.price_remark = nil
      @bid.valid?
      expect(@bid.errors.full_messages).to include("希望価格への返信を入力してください")
    end
    it 'メッセージが空だと登録できない' do
      @bid.message = nil
      @bid.valid?
      expect(@bid.errors.full_messages).to include("クライアント様へのメッセージを入力してください")
    end
  end
end