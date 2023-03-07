import karax/[karaxdsl, kbase, vstyles, vdom]

import ../pages
import ../state


const
  entries = {
    Page.index: ("🏠", "#/"),
    Page.notfound: ("404", "#/does/not/exist")
  }


proc render*: VNode =
  buildHtml:
    tdiv(style = {width: "100%", height: "40px", background: "aliceblue"}):
      for (page, link) in entries: 
        span(style = {paddingRight: "10px"}):
          if page == currentPage:
            text link[0]
          else:
            a(href = kstring link[1]): text link[0]

