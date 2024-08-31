import karax/[karaxdsl, kdom, vdom]
import kraut

import ../[pages, state]
import ../components/layout


proc render*(context: Context): VNode =
  currentPage = Page.notfound
  document.title = "notfound"

  buildHtml:
    layout.render buildHtml(tdiv) do:
      h1: text "notfound"

