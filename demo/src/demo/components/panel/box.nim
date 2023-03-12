import karax/[kbase, vstyles]

import ../component


type
  Direction* = enum
    ltr, rtl
  Alignment* = enum
    top, center, bottom
  Box* = object of Component
    flex*: Natural = 1
    direction* = ltr


proc initBox*(flex: Natural = 1, direction = ltr, alignment = center, customStyle = style()): Box =
  let
    flexDirection = case direction
      of ltr:
        "row"
      of rtl:
        "row-reverse"
    alignItems = case alignment
      of center:
        "center"
      of top:
        "normal"
      of bottom:
        "end"
    defaultStyle = style {
      StyleAttr.display: kstring "flex",
      StyleAttr.flex: kstring $flex,
      StyleAttr.flexDirection: kstring flexDirection,
      StyleAttr.alignItems: kstring alignItems
    }

  Box(flex: flex, style: defaultStyle.merge(customStyle))

