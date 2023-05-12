import karax/[kbase, vstyles]

import ../component


type
  Direction* = enum
    ltr, rtl
  Alignment* = enum
    top, center, bottom
  HBox* = object of Component
    flex*: Natural = 1
    direction* = ltr


proc initHBox*(flex: Natural = 1, direction = ltr, alignment = center, customStyle = style()): HBox =
  let
    flexDirection = case direction
      of ltr:
        "row"
      of rtl:
        "row-reverse"
    alignItems = case alignment
      of top:
        "normal"
      of center:
        "center"
      of bottom:
        "end"
    defaultStyle = style {
      StyleAttr.display: kstring "flex",
      StyleAttr.flex: kstring $flex,
      StyleAttr.flexDirection: kstring flexDirection,
      StyleAttr.alignItems: kstring alignItems
    }

  HBox(flex: flex, style: defaultStyle.merge(customStyle))

