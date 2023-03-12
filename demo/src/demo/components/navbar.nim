import karax/[karaxdsl, kbase, vstyles, vdom]

import ../pages
import ../state
import component, panel
import panel/[hbox, spacer]


const
  entries = {
    Page.index: ("Home", "#/"),
    Page.notfound: ("404", "#/does/not/exist")
  }

let
  topPanelStyle = style {
    background: kstring "pink",
    height: kstring topPanelHeight
  }
  topPanel = initPanel(sticky = true, customStyle = topPanelStyle)
  topSpacer = initSpacer(1, customStyle= style {maxWidth: kstring "40px"})
  topHBox = initHBox(12, customStyle = style {background: kstring "gray"})
  topSpacer2 = initSpacer(5)
  topHBox2 = initHBox(2, rtl, customStyle = style {background: kstring "orange", minWidth: "200px"})


proc render*: VNode =
  buildHtml:
    topPanel.render buildHtml(tdiv) do:
      topSpacer.render()
      topHBox.render buildHtml(tdiv) do:
        for (page, link) in entries: 
          let entryHBox = initHBox()
          entryHBox.render buildHtml(tdiv) do:
            if page == currentPage:
              text link[0]
            else:
              a(href = kstring link[1]): text link[0]
      topSpacer2.render()
      topHBox2.render buildHtml(tdiv) do:
        a(href = "https://ddg.gg/", target = "_blank"):
          text "DuckDuckGo →"

