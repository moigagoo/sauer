#? stdtmpl
#proc content*(pageName: string): string =
import karax/[karaxdsl, vdom]
import kraut/context

import ../pages
import ../state


proc render*(context: Context): VNode =
  currentPage = Page.${pageName}

  buildHtml(tdiv):
    h1: text "${pageName}"

