import karax/[karaxdsl, kbase, vstyles, vdom]

import component, bottompanel
import panel/[vbox, spacer]


const
  entries = [
    ["About us", "Contact us"],
    ["Site map", "Documents"]
  ]

let
  footerPanel = initBottomPanel(sticky = true, customStyle = style {height: kstring "200px", background: "aliceblue"})
  footerSpacer = initSpacer(len(entries))


proc render*: VNode =
  buildHtml:
    footerPanel.render buildHtml(tdiv) do:
      for entry in entries:
        let listVBox = initVBox(alignment = center)
        listVBox.render buildHtml(tdiv) do:
          ul:
            for i in entry:
              li: text kstring i

      footerSpacer.render()

