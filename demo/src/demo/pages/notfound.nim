import karax/[karaxdsl, kdom, vdom]
import kraut/context

import ../pages
import ../state
import ../components/layout


proc render*(context: Context): VNode =
  currentPage = Page.notfound
  document.title = "notfound"

  buildHtml:
    layout.render:
      h1: text "notfound"

