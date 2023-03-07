import karax/[karaxdsl, vdom]
import kraut/context

import ../pages
import ../state


proc render*(context: Context): VNode =
  currentPage = Page.notfound

  buildHtml(tdiv):
    h1: text "notfound"

