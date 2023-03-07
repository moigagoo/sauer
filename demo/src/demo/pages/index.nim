import karax/[karaxdsl, vdom]
import kraut/context

import ../pages
import ../state
import ../components/layout


proc render*(context: Context): VNode =
  currentPage = Page.index

  layout.render:
    h1: text "index"

