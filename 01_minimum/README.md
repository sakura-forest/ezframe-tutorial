チュートリアル1: minimum 最小限の構成
---

# 使い方

1. git clone git@github.com:sakura-forest/ezframe-template.git
2. cd ezframe-template/01_minimum
3. bundle install --path=vendor/bundle
4. bundle exec create_table.rb
5. bundle exec rackup --port 3000
6. ブラウザで http://localhost:3000 を開く

# ポイント

* pages/basic.rbにH1要素を表示するメソッドを定義しています。

* http://localhost:3000/basic でもAddressクラスにアクセスできます。
  * /で、どのクラスにアクセスするかは、config/generic.ymlの中のdefault_page_classで設定します。

* public_default_pageメソッドは/でアクセスしたときに、呼び出されます。

## URLの追加

* 例えば http://localhost:3000/another でアクセスを可能にしたいとします。

* basic.rbのBasicクラスの中に以下のメソッドを追加します。
```ruby

  def public_another_page
    return "<H2>another URL</H2>"
  end

```

* rackupを再起動して、ブラウザで http://localhost:3000/another を開いてみてください。

