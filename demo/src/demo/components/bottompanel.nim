import karax/[kbase, vstyles]

import component


type BottomPanel* = object of Component
  sticky*: bool 


proc initBottomPanel*(sticky = false, customStyle = style()): BottomPanel =
  let
    defaultStyle = style {
      StyleAttr.width: kstring "100%",
      StyleAttr.display: kstring "flex"
    }
    stickyStyle =
      if sticky:
        style {
          StyleAttr.bottom: kstring "0",
          StyleAttr.position: kstring "fixed"
        }
      else:
        style()

  BottomPanel(sticky: sticky, style: defaultStyle.merge(stickyStyle).merge(customStyle))

