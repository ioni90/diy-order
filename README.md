## README

# :diamond_shape_with_a_dot_inside: アプリケーション名「DIY家具屋さん」  
  
# :mega: アプリケーション概要
  ### DIYが大好きな人と、どこにも売っていないオリジナル家具が欲しい人のためのアプリです。  
  「隙間時間に趣味のDIYで収入を得ることができたら嬉しい！」「こういった特徴を持った家具が欲しいけど何処にも売ってない…」そんな思いを持つ方たちへのプラットフォーム。  
  
  このアプリケーションは以下の２つの目的で開発されました。
  - DIYを誰でももっと楽しめる場を提供したい
  - 自分のオリジナルの家具を気軽に手に入れて欲しい
  
  ## 「DIYをもっと楽しめる場を提供したい」
  家具制作プロじゃない方にこそDIYに参加して欲しいと思っています。どんな家具が欲しいと思うかは人それぞれですので貴方にDIYして欲しい方が必ずいらっしゃいます。自分から「こういう条件の家具なら作れますよ？」と提案することもできる仕様になっていますのでまずは提案してみましょう！
  
  ## 「自分のオリジナルの家具を気軽に手に入れて欲しい」
  自分の希望に合う家具が意外と見つからないことはないでしょうか。少し高めの長テーブルが欲しいと思っただけでも高額な特注になってしまう事があります。自分のお部屋ですから色、材質、デザイン、好きな条件の家具を使って欲しいと心から思っています。DIYなので制作される方はプロではないかも知れません。ですが貴方の希望を満足させる方がたくさんいらっしゃるはずです。まずは家具の条件を入力して反応を見てみましょう！
  
  # :globe_with_meridians: 使用言語・技術
  - Ruby
  - Ruby on Rails
  - JavaScript
  - HTML/CSS
  - SQL
  
# :dvd: URL
  [アプリURL]https://diy-order.herokuapp.com/
  


# 利用方法
  * Basic認証
    * ID:syake
    * Pass:shiromi

  * テスト用アカウント
    * 発注者用(email:sample@sample.com, password:mino89)
    * 購入者用(email:sample2@sample.com, password:mino89)  

  * テスト用カード
    * カード番号：4242424242424242
    * CVC：123  
    * 期限日：11/24

  **1. 家具の発注まで**  
    - アクセスするとトップページに遷移  
    - ヘッダーの「ログイン」をクリック  
    - ログインページに遷移した上で、上記テスト用アカウントでログイン  
    - トップページの画面をクリックして家具発注ページに遷移
    ![7bddc15b5b0aaaffadf3cd1dd5f74c89](https://user-images.githubusercontent.com/69069717/104795192-cba01b80-57ef-11eb-9ba5-7ff6a4d25c61.gif)
    - 発注ページで欲しい家具の条件を入力したらオーダーボタンをクリック  
    - トップページの下部一覧に貴方の家具が現れます
    ![d606ab616262be15c1e312270fdc0a70](https://user-images.githubusercontent.com/69069717/104791779-4a408d00-57df-11eb-8d54-b12c23d34878.gif)
    - ログアウトして購入者用のアカウントへ変更  

  **2. 発注されている家具を入札する**  
    - ベージ下部の家具一覧の中から好きな物を選択  
    - 発注者が設定している家具の条件を見て、自分が制作できそうかチェックし、一つ一つにどのように作るかリプライをする  
    ![b3dfa653fe2d3985a73a101a0f587ffe](https://user-images.githubusercontent.com/69069717/104794078-bbd10900-57e8-11eb-8ba6-25b184db525d.gif)  
    - 入札ボタンをクリック→相手がログインした際に入札した内容が表示されます  
    - ログアウトして発注者用のアカウントへ変更  

  **3. 入札されている中から家具をDIYしてもらう**  
    - 発注者アカウントへ変更
    - 家具が入札されていればページトップにプレゼントマークが表示されるので、それをクリック  
    - 入札で提案された条件を確認する  
    - OKであれば製作者さんへのメッセージを記入して承認  
    - 住所とカード番号を入力するページに遷移するので記入する  
    - 終了です  

  **4. 入札が承認されたかチェックする**
    - 購入者側でログイン  
    - トップページ上部に入札されたメッセージが表示されます  
    - メッセージをクリック  
    - 発注者さんからのメッセージと残り家具制作日数が確認できます

# :white_check_mark: 目指した課題解決
  | ユーザーストーリーから考える課題           | 課題解決                                      |
  | --- | --- |
  | DIYが好きだけど作っても置き場所がない      | 誰か家具を欲しがっている人に作ってあげられるようにする |
  | 気軽で安全に副業したい                   | 家具を作ってあげることで、対価として支払をうけれるようにする |
  | 自分好みの家具を探しているが見つからない    | 自分で条件を入力して思い通りの家具の発注ができるようにする |
  | 特注の家具は高額で購入が難しい            | 価格は自分で決められるようにする |  
  


# :high_brightness: 機能一覧
|  機能 | 詳細 |
| --- | --- |
|  ほしい家具の条件入力機能              | 自分の用途趣味に合わせた特別な家具をDIYできる人がいるか見てもらう為、制作してほしい家具の情報、購入金額を入力する           |
|  DIY希望機能                    | 一覧にある家具の中にもし制作したい家具があったら、DIY可能な条件を提示し入札をする          |製作者が可能なDIYの条件、提案を入力して依頼者に伝える             |
|  DIY承認機能                    |依頼者が自分の必須のDIY条件が満たされていることを確認したあとで承認できるかどうかを決められる |
|  ユーザー管理機能 | ユーザーが新規登録、ログイン、ログアウトをできるようにする            |
|  ほしい家具詳細確認機能           | 製作者がDIYできそうかチェックする為に、掲示されている家具の詳細を確認する                                |依頼者が入力した情報の一覧が見れる                            |                                 |


# :small_orange_diamond: データベース設計
  ![ER図](https://user-images.githubusercontent.com/69069717/104797796-352a2500-5804-11eb-9c8f-d70c9085f15a.png)

## :small_blue_diamond: users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :orders
- has_many :bids

##  :small_blue_diamond:orders テーブル

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

## :small_blue_diamond: closures テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| order_id | references | null: false, foreign_key: true |
| bid_id   | references | null: false, foreign_key: true |
| reply    | text       |                                |

### Association

- belongs_to :order
- belongs_to :bid
- has_one :address

## :small_blue_diamond: bids テーブル

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

## :small_blue_diamond: addresses テーブル

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

## :computer: ローカルでの動作方法
  % git clone https://github.com/ioni90/diy-order.git  
  % cd diy-order  
  % bundle install  
  % rails db:create  
  % rails db:migrate  
  % rails s  
  :point_right: http://localhost:3000

## :construction: 開発環境
  * VScode
* Ruby 2.6.5
* Rails 6.0.3.4
* mysql2 0.5.3
* JavaScript
* gem 3.0.3
* heroku 7.47.7