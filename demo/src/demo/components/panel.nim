import karax/[karaxdsl, kbase, vstyles, vdom]


type Panel* = object of RootObj
  sticky*: bool 
  style: VStyle


proc initPanel*(sticky = false, customStyle = style()): Panel =
  let
    defaultStyle = style {
      width: kstring "100%",
      display: "flex"
    }
    stickyStyle =
      if sticky:
        style {
          top: kstring "0",
          position: "sticky"
        }
      else:
        style()

  Panel(sticky: sticky, style: defaultStyle.merge(stickyStyle).merge(customStyle))
     
proc style*(panel: Panel): VStyle =
  panel.style

template render*(panel: Panel, body: untyped): untyped =
  buildHtml:
    tdiv(style = panel.style):
      body

