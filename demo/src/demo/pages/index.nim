import karax/[karaxdsl, vdom]
import kraut/context

import ../pages
import ../state


proc render*(context: Context): VNode =
  currentPage = Page.index

  buildHtml(tdiv):
    h1: text "index"

