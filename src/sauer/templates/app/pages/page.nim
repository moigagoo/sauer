#? stdtmpl
#proc content*(pageName: string): string =
import karax/[karaxdsl, kdom, vdom]
import kraut/context

import ../[pages, state]


proc render*(context: Context): VNode =
  currentPage = Page.${pageName}
  document.title = "${pageName}"

  buildHtml(tdiv):
    h1: text "${pageName}"

