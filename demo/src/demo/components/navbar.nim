import karax/[karaxdsl, kbase, vstyles, vdom]

import ../pages
import ../state
import panel


const
  entries = {
    Page.index: ("🏠", "#/"),
    Page.notfound: ("404", "#/does/not/exist")
  }

let
  topPanelStyle = style {
    background: kstring "pink",
    height: kstring topPanelHeight
  }
  topPanel = initPanel(sticky = true, customStyle = topPanelStyle)

proc render*: VNode =
  buildHtml:
    topPanel.render:
      for (page, link) in entries: 
        span(style = {paddingRight: "10px"}):
          if page == currentPage:
            text link[0]
          else:
            a(href = kstring link[1]): text link[0]

