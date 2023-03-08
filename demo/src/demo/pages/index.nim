import karax/[karaxdsl, kdom, vdom]
import kraut/context

import ../pages
import ../state
import ../components/layout


proc render*(context: Context): VNode =
  currentPage = Page.index
  document.title = "index"

  layout.render:
    h1: text "index"

