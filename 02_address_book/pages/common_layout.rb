  module Ezframe
    module CommonLayout
    # 全体のページのレイアウト
    def main_layout(left: "", center: "", right: "")
      Ht.div(child: [Ht.div(class: %w[row], child: topnav),
                     Ht.div(class: %w[container], child: [
                              Ht.div(class: %w[row], child: [
                                       Ht.div(class: %w[col s0 m0 l3 hide-on-small-only], id: "left-panel", child: left),
                                       Ht.div(class: %w[col s12 m5 l5], id: "center-panel", child: center),
                                       Ht.div(class: %w[col s12 m5 l4], id: "right-panel", child: right),
                                     ]),
                            ])])
    end

    # 一覧ページのレイアウト(左端のパネルが無い)
    def index_layout(left: "", center: "")
      Ht.div(child: [Ht.div(class: %w[row], child: topnav),
                     Ht.div(class: %w[container], child: [
                              Ht.div(class: %w[row], child: [
                                       Ht.div(class: %w[col s0 m0 l3 hide-on-small-only], id: "left-panel", child: left),
                                       Ht.div(class: %w[col s12 m12 l9], id: "center-panel", child: center),
                                     ]),
                            ])])
    end

    # ページ最上部のツールバー
    def topnav
      child = [
        Ht.a(href: "#", "data-target": "nav-mobile", class: %w[sidenav-trigger], child: Ht.icon(class: %w[black-text], name: "menu")),
        Ht.a(href: "/#{@target}", class: %w[right], child: Ht.img(src: "https://img.sakura-forest.com/asset/images/content/logo.png")),
      ]
      Ht.nav(id: "sidenav", class: "white", child: Ht.div(class: %w[nav-wrapper], child: child))
    end

    # 左のナビゲーションバー
    def sidenav
      components = [
        Ht.div(class: %w[row], child: Ht.a(href: "/#{@target}/new", child: [Ht.icon("add"), "新規登録"])),
      ]
      list = Ht::Ul.new
      components.map {|el| list.push(el) }
      div = Ht.multi_div([%w[container]], list.to_h)
      Ht.div(id: "nav-mobile", class: %w[sidenav sidenav-fixed], child: div)
    end
  end
end