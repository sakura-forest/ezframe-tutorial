チュートリアル1: アドレス帳の作成
---

# 使い方

1. git clone git@github.com:sakura-forest/ezframe-template.git
2. cd ezframe-template/02_address_book
3. bundle install --path=vendor/bundle
4. bundle exec rackup --port 3001
5. ブラウザで[http://localhost:3001]を開く

# ポイント

* columns/address.ymlにデータ項目を登録する
* pages/address.rbでEzframeモジュールに含まれるAddressクラスを定義する。
 


