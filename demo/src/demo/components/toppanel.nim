import karax/[kbase, vstyles]

import component


type TopPanel* = object of Component
  sticky*: bool 


proc initTopPanel*(sticky = false, customStyle = style()): TopPanel =
  let
    defaultStyle = style {
      StyleAttr.width: kstring "100%",
      StyleAttr.display: kstring "flex"
    }
    stickyStyle =
      if sticky:
        style {
          StyleAttr.top: kstring "0",
          StyleAttr.position: kstring "sticky"
        }
      else:
        style()

  TopPanel(sticky: sticky, style: defaultStyle.merge(stickyStyle).merge(customStyle))

