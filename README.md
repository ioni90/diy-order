# README

## アプリケーション名
  DIY家具屋さん

## アプリケーション概要
  自ら設定した価格で自分好みの家具の発注ができ、一方で発注されている家具の中からDIYをしてお金を稼ぐこともできるアプリ。

## URL
  [アプリURL]https://diy-order.herokuapp.com/

* テスト用アカウント
  * 発注者用(email:sample@sample.com, password:mino89)
  * 購入者用(email:sample2@sample.com, password:mino89)

* Basic認証
  * ID:syake
  * Pass:shiromi

## 利用方法
  家具を詳細を入力して発注をする。またはDIYできる家具の条件を見て自分で制作できそうなら入札をすることができる。
  発注者が入札をOKすれば制作可能になる。

## 目指した課題解決
  自分好みの家具を探しているが見つからない人へ、簡単に家具を自分の予算で発注できるようにする。
  またDIYが好きな人が他人へ家具を作ってあげることで収入を得られるようにする。

## 洗い出した要件
| 優先順位 |  機能                          | 目的                                                         | 詳細                                                    | ストーリー(ユースケース)                                       | 所要時間 |
| ------- | ----------------------------- | ----------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------- | ------ |
|  高     |  ほしい家具掲示機能              | 自分の用途、趣味に合わせた特別な家具をDIYできる人がいるか見てもらうため |制作してほしい家具の情報、購入金額を入力して、掲示する            |家具制作依頼者がニスで塗装されたテーブルがほしい等入力する            | 30h    |
|  高     |  DIY希望機能                    | 掲示板にある特注家具をDIY可能な旨を依頼者に伝える                  |製作者が可能なDIYの条件、提案を入力して依頼者に伝える             |製作者が食卓用であれば水性ウレタンニスなどを提案する                 | 25h    |
|  高     |  DIY同意機能                    | 家具製作者が提案した条件を依頼者が受け入れる                       |依頼者がDIY条件をチェックして同意ボタンを押す                   |依頼者が自分の必須条件が満たされていることを確認する                 | 10h    |
|  低     |  DIYする方の実績確認ページ        | 今まで制作した家具がどのようなものなのかを見る                      |製作者個人ページに遷移し、家具一覧や本人のコメントを見ることができる|これから制作される家具のイメージを掴む                             | 20h    |
|  高     |  ユーザー登録ログインログアウト機能 | ユーザーが新規登録、ログイン、ログアウトをできるようにする            |ユーザー情報を入力し、ユーザー登録、ログインログアウトができる     |本人確認のためユーザー認証をできるようにする                        | 20h    |
|  高     |  ほしい家具詳細確認機能           | 掲示されている家具の詳細を確認する                                |依頼者が入力した情報の一覧が見れる                            |製作者がDIYできそうかチェックする                                 | 20h    |
|  中     |  ソート機能                     | 掲示されている家具群のソートをする                                |家具の種類のチェックボックスをチェックする                      |複数の家具から自分の制作できるものを探しやすくする                   | 25h    |
|  低     |  掲示家具自動削除機能             | かなりの期間が過ぎても製作されない掲示家具を自動削除する             |60日以上掲示されている家具は削除される                         |いつまでもDIYされず、掲示されていることを忘れてしまっても自動で削除される| 25h    | 

## 実装した機能についての画像
  [トップページ]https://gyazo.com/36a5201fa7df9ddda268a7349d80009f
  [発注画面]https://gyazo.com/eceef8ae358d7b2de1321b1de31bf131
  [入札後画面]https://gyazo.com/5c85a8fa0ecfe26090260f25a1890d40


## 実装予定の機能
  ソート機能

## データベース設計
  [ER図]https://gyazo.com/08277a6b9c960c4a6bc575dcc8beb770

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :orders
- has_many :bids

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| story            | text       | null: false                    |
| type_id          | integer    | null: false                    |
| price            | integer    | null: false                    |
| size             | string     | null: false                    |
| material         | text       |                                |
| detail           | text       |                                |
| delivery_time_id | integer    | null: false                    |
| user_id          | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_many :bids
- has_one :closure

## closures テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| order_id | references | null: false, foreign_key: true |
| bid_id   | references | null: false, foreign_key: true |
| reply    | text       |                                |

### Association

- belongs_to :order
- belongs_to :bid
- has_one :address

## bids テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| order_id             | references | foreign_key: true, null: false |
| user_id              | references | foreign_key: true, null: false |
| price_ok             | boolean    | default: false, null: false    |
| size_ok              | boolean    | default: false, null: false    |
| material_ok          | boolean    | default: false, null: false    |
| detail_ok            | boolean    | default: false, null: false    |
| delivery_time_ok     | boolean    | default: false, null: false    |
| price_remark         | text       | null: false                    |
| size_remark          | text       | null: false                    |
| material_remark      | text       | null: false                    |
| detail_remark        | text       | null: false                    |
| delivery_time_remark | text       | null: false                    |
| message              | text       | null: false                    |
| offer_price          | integer    |                                |

### Association

- belongs_to :user
- belongs_to :order
- has_one :closure

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| location       | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| closure_id     | references | foreign_key: true              |

### Association

- belongs_to :closure

## ローカルでの動作方法
  % git clone https://github.com/ioni90/diy-order.git
  % bundle install
  % rails s

  * 追加したgem
    * rspec-rails
    * factory_bot_rails
    * faker
    * devise
    * pry-rails
    * active_hash
    * payjp

  rubyバージョン: ruby 2.6.5p114
  railsバージョn: Rails 6.0.3.4