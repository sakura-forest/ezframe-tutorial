チュートリアル1: アドレス帳の作成
---

# 使い方

1. git clone git@github.com:sakura-forest/ezframe-tutorial.git
2. cd ezframe-tutorial/02_address_book
3. bundle install --path=vendor/bundle
4. bundle exec create_table
5. bundle exec rackup --port 3001
6. ブラウザで http://localhost:3001 を開く。

# ポイント

* columns/address.ymlにデータ項目を登録します。
  * keyはデータベースやHTML上で使われる名称です。半角英数とアンダースコアが使えます。
  * labelは、HTML上の表などで表示される項目名称です。
  * typeはデータの型を定義します。
    * 使える型はezframe/lib/column_type.rbの中で定義されているものです。
* pages/address.rbでEzframeモジュールに含まれるAddressクラスを定義します。
  * columns/*.ymlで定義したのと同じ名前のクラスを作ってください。
  * ファイル名は何でもいい。
* http://localhost:3001/address でもAddressクラスにアクセスできます。
  * /で、どのクラスにアクセスするかは、config/generic.ymlの中のdefault_page_classで設定します。

# データ項目の追加

* columns/address.ymlにデータ項目を追加します。
  
```yaml
- key: tel
  label: 電話番号
  type: tel
```

* データベースを作り直して、サーバーを再起動します。

```sh
rm db/devel.sql
bundle exec create_table
bundle exec rackup --port 3001
```

* ブラウザをリロードして、データを新規データを追加してみてください。
