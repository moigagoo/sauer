import karax/[kbase, vstyles]

import component


type Panel* = object of Component
  sticky*: bool 


proc initPanel*(sticky = false, customStyle = style()): Panel =
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

  Panel(sticky: sticky, style: defaultStyle.merge(stickyStyle).merge(customStyle))

