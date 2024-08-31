import karax/[karaxdsl, kdom, vdom]
import kraut

import ../[pages, state]
import ../components/layout


proc render*(context: Context): VNode =
  currentPage = Page.index
  document.title = "index"

  buildHtml:
    layout.render buildHtml(tdiv) do:
      h1: text "index"

      for i in 1..100:
        p:
          text "Lorem ipsum"

