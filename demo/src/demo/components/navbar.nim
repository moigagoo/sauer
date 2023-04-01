import std/sugar

import karax/[karax, karaxdsl, kbase, vstyles, vdom]

import ../pages
import ../state
import component, toppanel
import panel/[hbox, spacer]


const
  entries = {
    Page.index: ("Home", "#/"),
    Page.notfound: ("404", "#/does/not/exist")
  }

var
  topPanelStyle = style {
    background: kstring "pink",
    height: kstring topPanelHeight
  }
  navPanel = initTopPanel(sticky = true, customStyle = topPanelStyle)
  topSpacer = initSpacer(1, customStyle= style {maxWidth: kstring "40px"})
  topHBox = initHBox(12, customStyle = style {background: kstring "gray"})
  topSpacer2 = initSpacer(5)
  topHBox2 = initHBox(2, rtl, customStyle = style {background: kstring "orange", minWidth: "200px"})
  activeEntry = -1 
  entryHBoxes = collect:
    for i, e in entries:
      capture i:
        (i, e, initHBox(), proc() = activeEntry = i)

proc render*: VNode =
  buildHtml:
    navPanel.render buildHtml(tdiv) do:
      topSpacer.render()

      topHBox.render buildHtml(tdiv) do:
        for (i, entry, box, p) in entryHBoxes:
          let s =
            if i == activeEntry:
              style {background: kstring "red"}
            else:
              style()

          box.render buildHtml do:
            tdiv(onMouseOver = p, onMouseOut = proc() = activeEntry = -1, style = s):
              if entry[0] == currentPage:
                text entry[1][0]
              else:
                a(href = kstring entry[1][1]):
                  text entry[1][0]

      topSpacer2.render()

      topHBox2.render buildHtml(tdiv) do:
        text "DuckDuckGo →"

