require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'メールアドレスが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスは@を含まないと登録できない' do
      @user.email = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'パスワードは6文字未満だと登録できない' do
      @user.password = 'eeeee'
      @user.password_confirmation = 'eeeee'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードは確認用パスワードがマッチしないと登録できない' do
      @user.password_confirmation = 'wwwwwwwwwwww'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end