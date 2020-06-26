module Ezframe
  module PageLayout
    # 全体のページレイアウト(最上部ナビバー)
    def base_layout(child)
      return Ht.div(child: [
                      Ht.div(class: %w[row], child: topnav),
                      Ht.div(class: %w[container], child: Ht.div(class: %w[row], child: child)),
                    ])
    end

    def main_layout(left: sidenav, center: "", right: "", type: 2)
      case type
      when 1
        # 全体のページのレイアウト(３つのパネルが横並び)
        child = [
          Ht.div(class: %w[col s0 m0 l3 hide-on-small-only], id: "left-panel", child: left),
          Ht.div(class: %w[col s12 m5 l5], id: "center-panel", child: center),
          Ht.div(class: %w[col s12 m5 l4], id: "right-panel", child: right)
        ]
      when 2
        # 全体のページのレイアウト(サイドナビと、右側は縦に２つ)
        child = [
          Ht.div(class: %w[col m2 l2 hide-on-small-only], id: "left-panel", child: left),
          Ht.div(class: %w[col s12 m10 l10],  child: [ 
            Ht.div(class: %w[row], child: Ht.div(class: %w[col s12], id: "center-panel", child: center)),
            Ht.div(class: %w[row], child: Ht.div(class: %w[col s12], id: "right-panel", child: right))
          ])
        ]
      end
      return base_layout(child)
    end

    # 一覧ページのレイアウト(右端のパネルが無い)
    def index_layout(left: sidenav, center: "")
      return base_layout([
               Ht.div(class: %w[col s0 m0 l3 hide-on-small-only], id: "left-panel", child: left),
               Ht.div(class: %w[col s12 m12 l9], id: "center-panel", child: center),
             ])
    end

    # ページ最上部のツールバー
    def topnav
      child = [
        Ht.a(href: "#", "data-target": "nav-mobile", class: %w[sidenav-trigger], child: Ht.icon(class: %w[black-text], name: "menu")),
        Ht.a(href: "/admin/customer", class: %w[right], child: "Logo"),
      ]
      Ht.nav(id: "sidenav", class: "white", child: Ht.div(class: %w[nav-wrapper], child: child))
    end

    # 左のナビゲーションバー
    def sidenav
      base_url = "/"+Route::get_path(@class_snake).join("/")
      components=[
        Ht.form(class: %w[row], method: "POST", action: "#{base_url}/search", child: [
                  Ht.div(class: %w[input-field col s10], child: Ht.input(type: "text", name: "word", id: "word", label: "検索", final: true)),
                  Ht.div(class: %w[input-field col s2], child: search_button),
                ]),
        Ht.div(class: %w[row], child: Ht.a(href: "#{base_url}/create", child: [Ht.icon("add"), Message[:parent_create_page_title]])),
        Ht.div(class: %w[row], child: Ht.a(href: base_url, child: [Ht.icon("list"), Message[:index_page_title]])),
      ]
      list = Ht::Ul.new
      components.map { |el| list.push(el) }
      div = Ht.multi_div([%w[container]], list.to_h)
      Ht.div(id: "nav-mobile", class: %w[sidenav sidenav-fixed], child: div)
    end
    
    # 検索ボタン
    def search_button
      Ht.button(type: "submit", class: %w[btn-floating btn-small], child: Ht.icon("search"))
    end
  end
end